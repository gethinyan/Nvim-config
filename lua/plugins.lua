return {
    'marko-cerovac/material.nvim',
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
    'neovim/nvim-lspconfig',
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'onsails/lspkind-nvim',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-calc',
            'f3fora/cmp-spell',
            'hrsh7th/cmp-emoji'
        }
    },
    {
        'L3MON4D3/LuaSnip',
        version = 'v2.*',
        build = 'make install_jsregexp'
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
}