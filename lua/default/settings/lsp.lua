-- neodev config
require('neodev').setup {}

-- lsp-zero config
local lsp = require("lsp-zero").preset "recommended"

lsp.on_attach(function(_, bufnr) lsp.default_keymaps { buffer = bufnr } end)

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

-- nvim-cmp config
local luasnip = require 'luasnip'
local cmp = require "cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local function has_words_before()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
end

local function cmp_tab_completion(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif has_words_before() then
    cmp.complete()
  else
    fallback()
  end
end

local function cmp_shift_tab_completion(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

cmp.setup {
  snippet = {
    expand = function(args) require('luasnip').lsp_expand(args.body) end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'codeium' },
  }, {
    { name = 'buffer' },
  }),
  mapping = {
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<Tab>"] = cmp.mapping(cmp_tab_completion, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(cmp_shift_tab_completion, { "i", "s" }),
  },
}

-- null-ls config
local null_ls = require "null-ls"
local builtins = null_ls.builtins

null_ls.setup {
  sources = {
    builtins.code_actions.gitsigns,
    builtins.formatting.prettier,
  }
}

require("mason-null-ls").setup {
  automatic_installation = true,
}

-- flutter config
require('flutter-tools').setup {
  lsp = {
    capabilites = lsp.build_options('dartls', {}).capabilites,
  },
}

require('telescope').load_extension "flutter"

-- rust config
local rust_tools = require 'rust-tools'

rust_tools.setup {
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
    end
  },
}
