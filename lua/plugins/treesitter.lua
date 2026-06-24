return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    opts = {
        auto_install = true,
        ensure_installed = {
            'all'
        },
        highlight = {
            enable = true,
            disable = { "just" },
        },
        ignore_install = {},
        indent = {
            enable = true
        },
        modules = {},
        rainbow = {
            enable = true
        },
        sync_install = false,
    },
    config = function(_, opts)
        require('nvim-treesitter').setup(opts)
    end,
}
