require('neodev').setup {}

local lsp = require("lsp-zero").preset("recommended")

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps { buffer = bufnr }
end)

require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())
lsp.nvim_workspace {
  library = vim.api.nvim_get_runtime_file("", true),
}

lsp.format_on_save {
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ["lua_ls"] = { "lua" },
  },
}

lsp.skip_server_setup { 'rust_analyzer' }

lsp.setup()

local function has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require 'luasnip'
local cmp = require "cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }

---@diagnostic disable: assign-type-mismatch
cmp.setup {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },
}

local null_ls = require "null-ls"
local builtins = null_ls.builtins

null_ls.setup {
  sources = {
    builtins.code_actions.gitsigns,
    builtins.formatting.prettier,
  }
}

require("mason-null-ls").setup {
  ensure_installed = nil,
  automatic_installation = true,
}


require('flutter-tools').setup {
  lsp = {
    capabilites = lsp.build_options('dartls', {}).capabilites,
  },
}

local inlay_hints = require 'inlay-hints'
local rust_tools = require 'rust-tools'

rust_tools.setup {
  tools = {
    on_initialized = function() inlay_hints.set_all() end,
    inlay_hints = { auto = false },
  },
  server = {
    on_attach = function(client, bufnr)
      inlay_hints.on_attach(client, bufnr)

      vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
    end
  },
}
