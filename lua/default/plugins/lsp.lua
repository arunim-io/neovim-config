return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    },
  },
  { 'hrsh7th/nvim-cmp',     version = false },
  {
    'williamboman/mason.nvim',
    ---@diagnostic disable-next-line: param-type-mismatch
    build = function() pcall(vim.cmd, 'MasonUpdate') end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { 'nvim-lua/plenary.nvim', "williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim" },
  },
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    ft = { 'dart' },
    dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
  },
  {
    'simrat39/rust-tools.nvim',
    ft = { 'rust' },
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
  },
  { "folke/neodev.nvim",    opts = {} },
  { "b0o/schemastore.nvim", ft = { 'json', 'jsonc', 'toml', 'yaml', 'yml' } },
  {
    'stevearc/aerial.nvim',
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    opts = {
      placement = 'edge',
      autojump = true,
    },
    config = function(_, opts)
      require('aerial').setup(opts)
      require('telescope').load_extension 'aerial'
    end,
    keys = {
      { '<leader>a', '<cmd>AerialToggle!<CR>', desc = 'Open code outline window for current file with Aerial' },
    },
  },
  {
    'kosayoda/nvim-lightbulb',
    dependencies = { 'antoinemadec/FixCursorHold.nvim' },
    opts = {
      autocmd = { enabled = true },
    },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>d",  "<cmd>TroubleToggle<cr>",                       silent = true, noremap = true },
      { "<leader>dw", "<cmd>TroubleToggle workspace_diagnostics<cr>", silent = true, noremap = true },
      { "<leader>dd", "<cmd>TroubleToggle document_diagnostics<cr>",  silent = true, noremap = true },
      { "<leader>dl", "<cmd>TroubleToggle loclist<cr>",               silent = true, noremap = true },
      { "<leader>qf", "<cmd>TroubleToggle quickfix<cr>",              silent = true, noremap = true },
    },
  },
}
