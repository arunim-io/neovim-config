return {
  {
    'Mofiqul/vscode.nvim',
    lazy = false,
    priority = 1000,
    init = function() require('vscode').load() end,
    opts = {
      transparent = true,
      italic_comments = true,
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      show_current_context_start = true,
      space_char_blankline = " ",
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = function() require("nvim-treesitter.install").update { with_sync = true } end,
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'python' }
      },
    },
    config = function(_, opts) require('nvim-treesitter.configs').setup(opts) end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    opts = {
      extensions = { 'aerial', 'lazy', 'overseer', 'quickfix', 'trouble' },
      options = { theme = 'auto' },
      sections = {
        lualine_c = { 'filename', 'lsp_progress' },
        lualine_x = { 'overseer', 'encoding', 'fileformat', 'filetype' },
      },
    },
  },
  {
    "aserowy/tmux.nvim",
    lazy = false,
    opts = {
      navigation = { enable_default_keybindings = false },
      resize = { enable_default_keybindings = false },
    },
    keys = function()
      local tmux = require 'tmux'
      return {
        { '<A-Left>',  function() tmux.move_left() end,   desc = 'Move to left pane' },
        { '<A-Down>',  function() tmux.move_bottom() end, desc = 'Move to bottom pane' },
        { '<A-Up>',    function() tmux.move_top() end,    desc = 'Move to top pane' },
        { '<A-Right>', function() tmux.move_right() end,  desc = 'Move to right pane' },
      }
    end,
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = {
      default = true,
      strict = true,
    },
  },
  {
    "folke/twilight.nvim",
    config = true,
    keys = {
      { '<leader>tl', '<cmd>Twilight <cr>', desc = 'Toggle Twilight' },
    },
  },
  { 'lewis6991/gitsigns.nvim', config = true },
}
