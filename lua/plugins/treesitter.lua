return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag",
    },
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
                "java",
            },
            auto_install = false,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
        }
    end,
}
