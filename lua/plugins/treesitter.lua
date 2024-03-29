return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require "nvim-treesitter.configs"

        configs.setup {
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "query",
                "hcl",
                "c_sharp",
                "javascript",
                "typescript",
                "yaml",
                "dockerfile",
                "svelte",
            },
            auto_install = false,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        }
    end,
}
