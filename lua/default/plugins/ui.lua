return {
  {
    'Mofiqul/vscode.nvim',
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
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
    opts = {
      extensions = { 'aerial', 'lazy', 'overseer', 'quickfix', 'trouble' },
      options = {
        theme = 'codedark',
      },
      sections = {
        lualine_c = { 'filename', 'lsp_progress' },
        lualine_x = { 'overseer', 'encoding', 'fileformat', 'filetype' },
      },
    },
  },
  { 'prichrd/netrw.nvim',      opts = {} },
  {
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
    opts = {},
    keys = {
      { '<leader>tl', '<cmd>Twilight <cr>', desc = 'Toggle Twilight' },
    },
  },
  { 'lewis6991/gitsigns.nvim', opts = {} },
}
