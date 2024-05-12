return {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
        keys = "etovxqpdygfblzhckisuran",
    },
    config = function()
        require("hop").setup()
        vim.keymap.set("n", "<leader>h", "<cmd>:HopWord<CR>", { desc = "[H]op to a word" })
    end,
}
