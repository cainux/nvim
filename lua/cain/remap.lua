-- Default options
local opts = { silent = true }

-- Open netrw (try to use telescope instead)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", [["+p]], opts)

-- Copy to system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], opts)
vim.keymap.set("n", "<leader>Y", [["+Y]], opts)

-- Couple of interesting ways of leaving insert mode
vim.keymap.set("i", "<C-c>", "<ESC>", opts)
vim.keymap.set("i", "jk", "<ESC>", opts)

-- This is decades old for me
vim.keymap.set("n", "<C-s>", ":update<CR>", opts)

-- Move around in insert mode
vim.keymap.set("i", "<C-h>", "<left>", opts)
vim.keymap.set("i", "<C-j>", "<down>", opts)
vim.keymap.set("i", "<C-k>", "<up>", opts)
vim.keymap.set("i", "<C-l>", "<right>", opts)

-- Disable the arrow keys (really?)
-- vim.keymap.set({"n", "v", "i"}, "<up>", "<nop>", opts)
-- vim.keymap.set({"n", "v", "i"}, "<down>", "<nop>", opts)
-- vim.keymap.set({"n", "v", "i"}, "<left>", "<nop>", opts)
-- vim.keymap.set({"n", "v", "i"}, "<right>", "<nop>", opts)
