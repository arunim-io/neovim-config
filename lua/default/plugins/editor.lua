local inc_rename = {
  "smjonas/inc-rename.nvim",
  keys = {
    {
      "<leader>rn",
      function() return ":IncRename " .. vim.fn.expand("<cword>") end,
      expr = true
    },
  },
  opts = {
    input_buffer_type = "dressing",
  },
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
    { '<leader>S', function() require("spectre").open() end, desc = 'Open Spectre' },
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

local harpoon = {
  'ThePrimeagen/harpoon',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    global_settings = {
      save_on_toggle = true,
    },
  },
  keys = {
    { '<leader>hm', function() require("harpoon.mark").add_file() end, desc = 'Mark current file to harpoon' },
    {
      '<leader>hl',
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = 'Show list of marked files with harpoon',
    },
  },
}

local codeium = {
  'Exafunction/codeium.vim',
  lazy = false,
  --   keys = {
  --     { '<cr>',    function() return vim.fn['codeium#Accept']() end,             'i', expr = true },
  --     { '<tab>',   function() return vim.fn['codeium#CycleCompletions'](1) end,  'i', expr = true },
  --     { '<S-tab>', function() return vim.fn['codeium#CycleCompletions'](-1) end, 'i', expr = true },
  --     { '<esc>',   function() return vim.fn['codeium#Clear']() end,              'i', expr = true },
  --   }
}

return { inc_rename, snippets, spectre, twilight, ccc, harpoon, codeium }
