local keymap = vim.keymap

-- exit from current file without saving
keymap.set('n', '<leader>pv', vim.cmd.Ex)

-- move selected text up and down
keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv")
keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv")

-- append next line to the current one
keymap.set("n", "J", "mzJ`z")

-- navigate while searching
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- paste without losing current buffer
keymap.set("x", "<leader>p", [["_dP]])

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
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- make a script executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
