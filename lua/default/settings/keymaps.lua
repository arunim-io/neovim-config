local setKeymap = vim.keymap.set

-- move selected text up and down
setKeymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = 'Move selected line up' })
setKeymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = 'Move selected line down' })

-- append next line to the current one
setKeymap("n", "J", "mzJ`z", { desc = 'Append next line to the current one' })

-- navigate while searching
setKeymap("n", "n", "nzzzv")
setKeymap("n", "N", "Nzzzv")

-- paste without losing current buffer
setKeymap("x", "<leader>p", [["_dP]], { desc = 'Paste without losing buffer' })

-- paste to system clipboard
setKeymap({ "n", "v" }, "<leader>y", [["+y]])
setKeymap("n", "<leader>Y", [["+Y]])

-- prevents from exiting
setKeymap("n", "Q", "<nop>")

-- quick list
setKeymap("n", "<C-k>", "<cmd>cnext<CR>zz")
setKeymap("n", "<C-j>", "<cmd>cprev<CR>zz")
setKeymap("n", "<leader>k", "<cmd>lnext<CR>zz")
setKeymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the word under current cursor
setKeymap(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace text under cursor with regex' }
)

-- make a script executable
setKeymap(
  "n",
  "<leader>x",
  "<cmd>!chmod +x %<CR>",
  { silent = true, desc = 'Make the script in current buffer executable' }
)

-- format current file
setKeymap("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format current file' })

-- open code action menu
setKeymap('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Open code action menu' })

-- delete next word
setKeymap('n', '<C-Delete>', 'dw', { desc = "Delete next word", noremap = true, silent = true })

-- delete previous word
setKeymap('n', '<C-Bs>', 'db', { desc = "Delete previous word", noremap = true, silent = true })

-- select all
setKeymap('n', '<C-A>', 'ggVG', { desc = "Select all", noremap = true, silent = true })
