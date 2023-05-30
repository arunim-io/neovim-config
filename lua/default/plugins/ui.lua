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
  config = function()
    local telescope = require 'telescope'

    telescope.load_extension('fzf')
    telescope.load_extension('adjacent')
  end,
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    'prochri/telescope-all-recent.nvim',
    'LukasPietzschmann/telescope-tabs',
    "MaximilianLloyd/adjacent.nvim",
  },
  keys = {
    {
      '<leader>pf',
      function() require('telescope.builtin').find_files() end,
      desc = 'Open root directory with Telescope',
    },
    {
      '<leader>ps',
      function() require('telescope.builtin').grep_string({ search = vim.fn.input('Grep > ') }) end,

      desc = 'Search in root directory with Telescope',
    },
    {
      '<leader>pt',
      function() require('telescope-tabs').list_tabs() end,
      desc = 'Show open tabs with Telescope',
    },
    {
      "<leader>pa",
      "<cmd>Telescope adjacent<cr>",
      { noremap = true, silent = false },
      desc = 'Open adjacent files with Telescope',
    },
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

return { indent_blankline, treesitter, telescope, comment, which_key }
