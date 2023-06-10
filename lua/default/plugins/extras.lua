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
  {
    'gnikdroy/projections.nvim',
    config = function()
      require("projections").setup {
        workspaces = { '~/projects' },
      }

      require('telescope').load_extension 'projections'
      vim.keymap.set("n", "<leader>pw", "<cmd>Telescope projections<cr>",
        { desc = 'Open previoud sessions with projections' })

      local cwd = vim.loop.cwd()

      vim.api.nvim_create_autocmd({ 'VimLeavePre' }, {
        callback = function() require('projections.session').store(cwd) end,
      })
      vim.api.nvim_create_autocmd({ "VimEnter" }, {
        callback = function()
          if vim.fn.argc() == 0 then require('projections.switcher').switch(cwd) end
        end,
      })
    end,
  },
}
