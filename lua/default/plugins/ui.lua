local indent_blankline = {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    show_current_context = true,
    show_current_context_start = true,
    space_char_blankline = " ",
  }
}

local treesitter = {
  "nvim-treesitter/nvim-treesitter",
  build = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
}

local telescope = {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'prochri/telescope-all-recent.nvim',
    "MaximilianLloyd/adjacent.nvim",
    "debugloop/telescope-undo.nvim",
  },
  config = function()
    local telescope = require 'telescope'

    telescope.load_extension('fzf')
    telescope.load_extension('adjacent')
    telescope.load_extension("undo")
    telescope.load_extension('aerial')
    telescope.load_extension("flutter")
  end,
  keys = {
    {
      '<leader>pfr',
      function() require('telescope.builtin').find_files() end,
      desc = 'Open root directory with Telescope',
    },
    {
      '<leader>ps',
      function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') }) end,
      desc = 'Search in root directory with Telescope',
    },
    {
      "<leader>pfa",
      "<cmd>Telescope adjacent<cr>",
      noremap = true,
      silent = false,
      desc = 'Open adjacent files with Telescope',
    },
    { "<leader>u",  "<cmd>Telescope undo<cr>",   desc = 'Open undotree with Telescope' },
    { '<leader>pa', "<cmd>Telescope aerial<cr>", desc = "Open Aerial with Telescope" },
  },
}

local comment = {
  'numToStr/Comment.nvim',
  opts = {},
}

local which_key = {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
}

local lualine = {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      theme = 'codedark',
    },
  },
}

local netrw = { 'prichrd/netrw.nvim', opts = {} }

local trouble = {
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
}

local tmux = {
  "aserowy/tmux.nvim",
  lazy = false,
  opts = {
    navigation = {
      enable_default_keybindings = false,
    },
    resize = {
      enable_default_keybindings = false,
    },
  },
  keys = {
    { '<A-Left>',  [[<cmd>lua require("tmux").move_left()<cr>]] },
    { '<A-Down>',  [[<cmd>lua require("tmux").move_bottom()<cr>]] },
    { '<A-Up>',    [[<cmd>lua require("tmux").move_top()<cr>]] },
    { '<A-Right>', [[<cmd>lua require("tmux").move_right()<cr>]] },
  },
}

return { indent_blankline, treesitter, telescope, comment, which_key, lualine, netrw, trouble, tmux }
