return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      'neovim/nvim-lspconfig',
      {
        'williamboman/mason.nvim',
        ---@diagnostic disable-next-line: param-type-mismatch
        build = function() pcall(vim.cmd, 'MasonUpdate') end,
      },
      'williamboman/mason-lspconfig.nvim',

      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
    }
  },
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
    'stevearc/aerial.nvim',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
    config = function()
      require('aerial').setup {
        placement = 'edge',
        autojump = true,
      }
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
  {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    ft = { 'dart' },
    dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
  },
  {
    'simrat39/rust-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
  },
  { "folke/neodev.nvim", opts = {} },
}
