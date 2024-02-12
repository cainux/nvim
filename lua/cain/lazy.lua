-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- -- Setup Plugins
-- require("lazy").setup({
-- 
-- 
-- 
--     -- Debugging
--     { "mfussenegger/nvim-dap" },
--     { "rcarriga/nvim-dap-ui" },
-- 
-- 
--     -- Auto close the things you want to auto close!
--     -- { "m4xshen/autoclose.nvim" },
-- 
--     -- neotest
--     { 
--         "nvim-neotest/neotest",
--         dependencies = {
--             "nvim-lua/plenary.nvim",
--             "antoinemadec/FixCursorHold.nvim",
--             "nvim-treesitter/nvim-treesitter",
--             "Issafalcon/neotest-dotnet"
--         }
--     },
-- })
