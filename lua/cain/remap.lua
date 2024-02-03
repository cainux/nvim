-- Open netrw (try to use telescope instead)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", [["+p]])

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Not sure I'll get used to this
vim.keymap.set("i", "<C-c>", "<Esc>")

-- This is decades old for me
vim.keymap.set("n", "<C-s>", ":update<CR>")
