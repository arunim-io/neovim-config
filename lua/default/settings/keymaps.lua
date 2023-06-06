local keymap = vim.keymap

-- exit from current file without saving
keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'Switch to netrw' })

-- move selected text up and down
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = 'Move selected line up' })
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = 'Move selected line down' })

-- append next line to the current one
keymap.set("n", "J", "mzJ`z", { desc = 'Append next line to the current one' })

-- navigate while searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste without losing current buffer
keymap.set("x", "<leader>p", [["_dP]], { desc = 'Paste without losing buffer' })

-- paste to system clipboard
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

-- prevents from exiting
keymap.set("n", "Q", "<nop>")

-- quick list
keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- replace the word under current cursor
keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = 'Replace text under cursor with regex' }
)

-- make a script executable
keymap.set(
  "n",
  "<leader>x",
  "<cmd>!chmod +x %<CR>",
  { silent = true, desc = 'Make the script in current buffer executable' }
)

-- format current file
keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = 'Format current file' })

-- open code action menu
keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Open code action menu' })

-- Delete next word
keymap.set({ 'n', 'i' }, '<C-Delete>', 'dw', { desc = "Delete next word", noremap = true, silent = true })

-- Delete previous word
keymap.set({ 'n', 'i' }, '<C-Bs>', 'db', { desc = "Delete previous word", noremap = true, silent = true })
