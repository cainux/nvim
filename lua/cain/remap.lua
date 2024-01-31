-- Open netrw (try to use telescope instead)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", [["+p]])

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
