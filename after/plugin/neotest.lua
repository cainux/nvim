require("neotest").setup({
    adapters = {
        require("neotest-dotnet")({
            dotnet_additional_args = {
                "--verbosity detailed"
            },
            discovery_root = "solution"
        })
    }
})

local neotest = require("neotest")

vim.keymap.set("n", "<leader>tr", neotest.run.run)