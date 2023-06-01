local inc_rename = {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "<leader>rn",
      function() return ":IncRename " .. vim.fn.expand("<cword>") end,
      expr = true
    },
  },
  opts = {},
}

local snippets = {
  "L3MON4D3/LuaSnip",
  version = "1.*",
  build = "make install_jsregexp",
  dependencies = { "rafamadriz/friendly-snippets" },
  init = function() require("luasnip.loaders.from_vscode").lazy_load() end,
}

local spectre = {
  'nvim-pack/nvim-spectre',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    {
      '<leader>S',
      function() require("spectre").open() end,
      desc = 'Open Spectre',
    },
    {
      '<leader>sw',
      function() require("spectre").open_visual({ select_word = true }) end,
      desc = 'Search current word with Spectre',
    },
  },
}

local twilight = {
  "folke/twilight.nvim",
  opts = {},
  keys = {
    { '<leader>tl', '<cmd>Twilight <cr>', desc = 'Toggle Twilight' },
  },
}

local ccc = {
  'uga-rosa/ccc.nvim',
  opts = {
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  },
}

return { inc_rename, snippets, spectre, twilight, ccc }
