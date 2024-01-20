-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Setup Plugins
require('lazy').setup({

    -- Search for and open file
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter', build = ':TSUpdate',
        config = function()
            local configs = require('nvim-treesitter.configs')

            configs.setup({
                ensure_installed = {
                    'lua',
                    'vim',
                    'vimdoc',
                    'query',
                    'hcl',
                    'c_sharp',
                    'javascript',
                    'typescript',
                    'yaml',
                    'dockerfile'
                },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    { 'ThePrimeagen/harpoon' },

    { 'f-person/git-blame.nvim' },
})
