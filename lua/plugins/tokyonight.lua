return {
    {
        'folke/tokyonight.nvim',
        lazy = false,
        priority = 1000,
        opts = {
            style = 'night',
            styles = {
                floats = 'transparent',
                sidebars = 'transparent'
            },
            transparent = true,
            on_highlights = function(hl, c)
                local prompt = '#2d3149'

                hl.TelescopeNormal = {
                    bg = c.bg_dark,
                    fg = c.fg_dark
                }
                hl.TelescopeBorder = {
                    bg = c.bg_dark,
                    fg = c.bg_dark
                }
                hl.TelescopePromptNormal = {
                    bg = prompt
                }
                hl.TelescopePromptBorder = {
                    bg = prompt,
                    fg = prompt
                }
                hl.TelescopePromptTitle = {
                    bg = prompt,
                    fg = prompt
                }
                hl.TelescopePreviewTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark
                }
                hl.TelescopeResultsTitle = {
                    bg = c.bg_dark,
                    fg = c.bg_dark
                }
            end
        },
        config = function(_, opts)
            require('tokyonight').setup(opts)

            vim.cmd([[colorscheme tokyonight-night]])
        end,
        init = function()
            local settings = {
                clipboard = 'unnamedplus',
                colorcolumn = '80',
                expandtab = true,
                scrolloff = 3,
                shiftwidth = 4,
                shortmess = vim.o.shortmess .. 'c',
                splitright = true,
                tabstop = 4,
                termguicolors = true,
                updatetime = 300
            }

            for k, v in pairs(settings) do
                vim.o[k] = v
            end

            local settings = {
                foldexpr = 'nvim_treesitter#foldexpr()',
                foldlevel = 99,
                foldmethod = 'expr',
                number = true,
                relativenumber = true,
                wrap = false
            }

            for k, v in pairs(settings) do
                vim.wo[k] = v
            end

            vim.opt.laststatus = 3
            vim.opt.list = true
            vim.opt.listchars:append 'eol:↴'
            vim.opt.splitkeep = 'screen'

            local options = {noremap = false, silent = true}

            vim.keymap.set('n', '<leader>h', '<CMD>wincmd h<CR>', options)
            vim.keymap.set('n', '<leader>j', '<CMD>wincmd j<CR>', options)
            vim.keymap.set('n', '<leader>k', '<CMD>wincmd k<CR>', options)
            vim.keymap.set('n', '<leader>l', '<CMD>wincmd l<CR>', options)
        end
    }
}
