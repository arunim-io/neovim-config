return {
  {
    "kdheepak/lazygit.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { '<leader>gg', ':LazyGit<CR>', desc = 'Open lazygit' },
    },
  },
  {
    "jcdickinson/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      { "jcdickinson/http.nvim", build = "cargo build --workspace --release" }
    },
    opts = {},
  },
}
