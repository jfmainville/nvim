-- Define the leader action to be the space bar
vim.g.mapleader = " "
-- Save file
vim.keymap.set("n", "zz", function()
  vim.cmd("w")
end)
-- Save file and return to the project explorer view
vim.keymap.set("n", "zx", function()
  vim.cmd("w")
  vim.cmd("Oil")
end)
-- Navigate back to the project explorer view
vim.keymap.set("n", "<leader>pv", function()
  vim.cmd("Oil")
end)
-- Move the currently selected line down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- Move the currently selected line up
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Bring the line below up
vim.keymap.set("n", "J", "mzJ`z")
-- Go up multiple lines
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Go down multiple lines
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- Greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
-- Return to normal mode
vim.keymap.set("i", "jj", "<Esc>")
-- Replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Add the execute permission to the current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Source the current file
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
-- Open ChatGPT window
vim.keymap.set("n", "<leader>cg", "<cmd>ChatGPT<CR>")