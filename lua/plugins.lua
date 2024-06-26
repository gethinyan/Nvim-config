local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'marko-cerovac/material.nvim',
    'rstacruz/vim-closer',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    'andymass/vim-matchup',
    {
        'dense-analysis/ale',
        config = function()
            local g = vim.g
            g.ale_ruby_rubocop_auto_correct_all = 1
            g.ale_linters = {
                ruby = {
                    'rubocop',
                    'ruby'
                },
                lua = {
                    'lua_language_server'
                }
            }
        end
    },
    {
        'iamcco/markdown-preview.nvim',
        cmd = {
            'MarkdownPreviewToggle',
            'MarkdownPreview',
            'MarkdownPreviewStop'
        },
        ft = {
            'markdown'
        },
        build = function()
            vim.fn['mkdp#util#install']()
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        lazy = true,
        dependencies = {
            'nvim-lua/plenary.nvim',
            'kyazdani42/nvim-web-devicons'
        },
        config = function()
            require('gitsigns').setup {}
        end
    },
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        lazy = false,
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            require('nvim-tree').setup {}
        end
    },
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons'
    },
    {
        'neoclide/coc.nvim',
        branch = 'release'
    }
})

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
-- empty setup using defaults
require('nvim-tree').setup({
    sort_by = 'case_sensitive',
    hijack_cursor = true
})

require('bufferline').setup({
    options = {
        diagnostics = 'nvim_lsp',
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left'
            }
        }
    }
})
