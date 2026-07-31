vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", ";", ":", { desc = "Command Mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<leader>ws", ":saveas ", { desc = "Write As (Save unnamed buffer)", silent = false })
vim.keymap.set("n", "<leader>wr", [[:%s///g<Left><Left><Left>]], { desc = "Substitute fast" })
vim.keymap.set("n", "U", "<C-r>", { noremap = true, desc = "Redo" })

vim.keymap.set("n", "<leader>/", "gcc", { remap = true, desc = "Comment toggle line" })
vim.keymap.set("x", "<leader>/", "gc", { remap = true, desc = "Comment toggle selection" })
