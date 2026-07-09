return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
        },
    },
    opts = {
        defaults = {
            file_ignore_patterns = {
                '%.pem',
                'node_modules/.*',
                'secret.d/.*'
            },
            layout_strategy = 'horizontal',
            layout_config = {
                horizontal = {
                    prompt_position = 'top',
                    preview_width = 0.55,
                },
                vertical = {
                    mirror = false
                },
                width = 0.95,
                height = 0.90,
                preview_cutoff = 0,
            },
        }
    },
    config = function(_, opts)
        local telescope = require('telescope')

        telescope.load_extension('notify')
        telescope.setup(opts)

        local options = { noremap = false, silent = true }

        -- Builtin
        vim.keymap.set('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', options)
        vim.keymap.set('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files()<CR>',
            options)
        vim.keymap.set('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
        vim.keymap.set('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
        vim.keymap.set('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
        vim.keymap.set('n', '<leader>fd', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', options)
        vim.keymap.set('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', options)

        -- Language Servers
        vim.keymap.set('n', '<leader>lsd', '<CMD>lua require("telescope.builtin").lsp_definitions{}<CR>', options)
        vim.keymap.set('n', '<leader>lsi', '<CMD>lua require("telescope.builtin").lsp_implementations{}<CR>', options)
        vim.keymap.set('n', '<leader>lsl', '<CMD>lua require("telescope.builtin").lsp_code_actions{}<CR>', options)
        vim.keymap.set('n', '<leader>lst', '<CMD>lua require("telescope.builtin").lsp_type_definitions{}<CR>', options)

        -- Extensions
        vim.keymap.set('n', '<leader>fn', '<CMD>lua require("telescope").extensions.notify.notify()<CR>', options)
    end,
}
