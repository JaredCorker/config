local keymap = vim.keymap.set

vim.g.mapleader = " "

-- Normal mode
keymap("n", "<leader>qa", ":qa<CR>", { desc = "Quit all neovim" })
keymap("n", "<leader>qq", ":q<CR>", { desc = "Quit neovim" })
keymap("n", "<leader>qw", ":wq<CR>", { desc = "Write & Quit neovim" })
keymap("n", "<leader>ll", ":Lazy<CR>")
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")
keymap("n", "<leader>sd", ":w<CR>", { desc = "Save buffer" })
keymap("n", "<leader>sa", ":wa<CR>", { desc = "Save all" })
keymap("n", "G", "Gzb")
keymap("n", "<leader>G", "Gzb``")
keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")
keymap("n", "*", "*zz")
keymap("n", "#", "#zz")

keymap("n", "<leader>bn", "bnext", { desc = "Next buffer" })
keymap("n", "<leader>bp", "bprev", { desc = "Prev buffer" })

keymap("n", "<leader>sh", ":set nohls<CR>")

keymap({ "n", "v" }, "<leader>d", '"_d')
keymap({ "n", "v" }, "<leader>y", '"+y')
keymap("n", "<leader>Y", '"+Y')

keymap("n", "Q", "<nop>")

keymap("n", "<leader>sr", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", { desc = "Search and replace" })

keymap("n", "<leader>o", "o<Esc>k")
keymap("n", "<leader>O", "O<Esc>j")

keymap("n", "<leader>cl", 'yiwoconsole.log("<C-o>p", <C-o>p);<esc>', { desc = "Console log word under cursor" })
keymap(
  "n",
  "<leader>cj",
  'yiwoconsole.log("<C-o>p", JSON.stringify(<C-o>p));<esc>',
  { desc = "Console log word under cursor" }
)

keymap("n", "<leader>cfn", ":let @* = expand('%')<CR>", { desc = "Copy file name" })
keymap("n", "<leader>cfp", ":let @* = expand('%:p')<CR>", { desc = "Copy file path" })

keymap("n", "<leader>vs", ":vs<CR>", { desc = "Open vertical split" })

keymap("n", "<leader>co", ":copen<CR>", { desc = "Open qf list" })
keymap("n", "<leader>cc", ":cclose<CR>", { desc = "Close qf list" })
keymap("n", "<leader>cn", ":cnext<CR>", { desc = "Next qf item" })
keymap("n", "<leader>cp", ":cprev<CR>", { desc = "Previous qf item" })

keymap("n", "<leader>rp", "V$%d", { desc = "Remove paragraph" })
keymap("n", "<leader>yp", "V$%y", { desc = "Yank paragraph" })
keymap("n", "<leader>dp", "V$%y$%o<Esc>p", { desc = "Duplicate paragraph" })

keymap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle current line blame" })

keymap("n", "<leader>pp", ":!pnpm run format --fix<CR>", { desc = "Format with prettier" })

-- Insert mode
keymap("i", "kj", "<Esc>")

-- Visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- X mode
keymap("x", "<leader>p", '"_dP')

-- Custom functions
keymap("n", "<leader>so", function()
  local file_to_open
  local current_file = vim.fn.expand("%:p")
  if current_file:match("spec") then
    file_to_open = current_file:gsub("__tests__", ""):gsub("%.spec%.ts$", ".ts")
  else
    file_to_open = current_file:gsub("^(.-)([^/\\]+)%.ts$", "%1__tests__/%2.spec.ts")
  end
  if vim.fn.filereadable(file_to_open) == 1 then
    vim.cmd("edit " .. file_to_open)
  else
    print("File not found: " .. file_to_open)
  end
end, { noremap = true })
