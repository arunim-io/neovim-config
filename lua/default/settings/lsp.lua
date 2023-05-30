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

local cmp = require "cmp"
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = lsp.cmp_action()

cmp.setup {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<Tab>"] = cmp_action.tab_complete(),
    ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
  },
}

local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.gitsigns,
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
