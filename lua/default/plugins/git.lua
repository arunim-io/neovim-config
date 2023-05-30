local lazygit = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { '<leader>gg', ':LazyGit<CR>', desc = 'Open lazygit' },
  },
}

local git_signs = {
  'lewis6991/gitsigns.nvim'
}

return { lazygit, git_signs }
