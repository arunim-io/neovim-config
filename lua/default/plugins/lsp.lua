return {
  {
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
  },
  { 'simrat39/inlay-hints.nvim' },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      'nvim-lua/plenary.nvim',
      "williamboman/mason.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim',
    },
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'mfussenegger/nvim-dap',
    },
  },
}
