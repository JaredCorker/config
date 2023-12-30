local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Normal mode
keymap("n", "<leader>qa", ":qa<CR>", { desc = "Quit all neovim" })
keymap("n", "<leader>qq", ":q<CR>", { desc = "Quit neovim" })
keymap("n", "<leader>ll", ":Lazy<CR>")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<leader>ss", ":w<CR>")
keymap("n", "<leader>sa", ":wa<CR>")
keymap("n", "G", "Gzb")
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

keymap({ "n", "v" }, "<leader>d", "\"_d")
keymap({ "n", "v" }, "<leader>y", "\"+y")
keymap("n", "<leader>Y", "\"+Y")

keymap("n", "Q", "<nop>")

keymap("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Search and replace" })

keymap("n", "<leader>o", "o<Esc>k")
keymap("n", "<leader>O", "O<Esc>j")

-- Insert mode
keymap("i", "kj", "<Esc>")

-- Visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- X mode
keymap("x", "<leader>p", "\"_dP")
