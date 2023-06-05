local lsp_zero = {
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

local diagnostic_highlight = {
  'Kasama/nvim-custom-diagnostic-highlight',
  opts = {},
}

local aerial = {
  'stevearc/aerial.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    placement = 'edge',
    autojump = true,
  },
  keys = {
    { '<leader>a', '<cmd>AerialToggle!<CR>', desc = 'Open code outline window for current file with Aerial' },
  },
}

local fidget = {
  'j-hui/fidget.nvim',
  opts = {},
}

local lightbulb = {
  'kosayoda/nvim-lightbulb',
  dependencies = { 'antoinemadec/FixCursorHold.nvim' },
  opts = {
    autocmd = {
      enabled = true,
    },
  },
}

local flutter = {
  'akinsho/flutter-tools.nvim',
  lazy = false,
  ft = { 'dart' },
  dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/dressing.nvim' },
}

local rust = {
  'simrat39/rust-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'mfussenegger/nvim-dap' },
}

local neodev = {
  "folke/neodev.nvim",
  opts = {},
}

return { lsp_zero, null_ls, neodev, inlay_hints, flutter, rust, aerial, fidget, lightbulb, diagnostic_highlight }
