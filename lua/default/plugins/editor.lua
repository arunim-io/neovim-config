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

return { inc_rename }
