local lsp_zero = {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  dependencies = {
    { 'neovim/nvim-lspconfig' },
    {
      'williamboman/mason.nvim',
      build = function() pcall(vim.cmd, 'MasonUpdate') end,
    },
    { 'williamboman/mason-lspconfig.nvim' },

    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
  }
}

local null_ls = {
  "jay-babu/mason-null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    'nvim-lua/plenary.nvim',
    "williamboman/mason.nvim",
    "jose-elias-alvarez/null-ls.nvim",
  },
}

local inlay_hints = { 'simrat39/inlay-hints.nvim' }

local flutter = {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
}

local rust = {
  'simrat39/rust-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
}

return { lsp_zero, null_ls, inlay_hints, flutter, rust }
