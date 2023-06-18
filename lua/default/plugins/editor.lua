return {
  {
    "smjonas/inc-rename.nvim",
    keys = {
      {
        "<leader>rn",
        function() return ":IncRename " .. vim.fn.expand "<cword>" end,
        expr = true
      },
    },
    opts = {
      input_buffer_type = "dressing",
    },
  },
  {
    "L3MON4D3/LuaSnip",
    version = "1.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    init = function() require("luasnip.loaders.from_vscode").lazy_load() end,
  },
  {
    'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>S', function() require("spectre").open() end, desc = 'Open Spectre' },
      {
        '<leader>sw',
        function() require("spectre").open_visual { select_word = true } end,
        desc = 'Search current word with Spectre',
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      "MaximilianLloyd/adjacent.nvim",
      "debugloop/telescope-undo.nvim",
    },
    config = function()
      local telescope = require 'telescope'

      telescope.load_extension 'fzf'
      telescope.load_extension 'adjacent'
      telescope.load_extension "undo"
    end,
    keys = {
      { '<leader>b',  function() require('telescope.builtin').buffers() end, desc = 'Open buffers with Telescope' },
      {
        '<leader>pfr',
        function() require('telescope.builtin').find_files() end,
        desc = 'Open root directory with Telescope',
      },
      {
        '<leader>ps',
        function() require('telescope.builtin').grep_string { search = vim.fn.input 'Grep > ' } end,
        desc = 'Search in root directory with Telescope',
      },
      {
        "<leader>pfa",
        "<cmd>Telescope adjacent<cr>",
        noremap = true,
        silent = false,
        desc = 'Open adjacent files with Telescope',
      },
      { "<leader>u",  "<cmd>Telescope undo<cr>",                             desc = 'Open undotree with Telescope' },
      { '<leader>pa', "<cmd>Telescope aerial<cr>",                           desc = "Open Aerial with Telescope" },
    },
  },
  { 'numToStr/Comment.nvim',  opts = {} },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {},
  },
  {
    'uga-rosa/ccc.nvim',
    opts = {
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
    },
  },
  {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      global_settings = { save_on_toggle = true },
    },
    keys = {
      { '<leader>hm', function() require("harpoon.mark").add_file() end, desc = 'Mark current file to harpoon' },
      {
        '<leader>hl',
        function() require("harpoon.ui").toggle_quick_menu() end,
        desc = 'Show list of marked files with harpoon',
      },
    },
  },
  { 'stevearc/overseer.nvim', opts = {} },
  {
    'stevearc/oil.nvim',
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      delete_to_trash = true,
      trash_command = 'trash',
      view_options = {
        show_hidden = true,
      },
    },
    keys = {
      { '<leader>pv', '<cmd>Oil<cr>', desc = 'Open current directory with Oil' },
    },
  },
}
