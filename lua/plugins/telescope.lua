return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
    },

    opts = {
        defaults = {
            file_ignore_patterns = {
                "%.pem",
                "node_modules/.*",
                "secret.d/.*",
            },
            layout_strategy = "horizontal",
            layout_config = {
                horizontal = {
                    prompt_position = "top",
                    preview_width = 0.55,
                },
                vertical = {
                    mirror = false,
                },
                width = 0.95,
                height = 0.90,
                preview_cutoff = 0,
            },
        },

        pickers = {
            colorscheme = {
                enable_preview = true,
            },
        },
    },

    config = function(_, opts)
        local telescope = require("telescope")

        telescope.setup(opts)
        pcall(telescope.load_extension, "notify")
        pcall(telescope.load_extension, "fzf")

        local builtin = require("telescope.builtin")
        local options = { noremap = true, silent = true }

        -- Builtin
        vim.keymap.set("n", "<leader>fg", builtin.git_files, options)
        vim.keymap.set("n", "<leader>ff", builtin.find_files, options)
        vim.keymap.set("n", "<leader>fl", builtin.live_grep, options)
        vim.keymap.set("n", "<leader>fb", builtin.buffers, options)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, options)
        vim.keymap.set("n", "<leader>fd", builtin.diagnostics, options)
        vim.keymap.set("n", "<leader>fr", builtin.registers, options)

        -- Theme picker with live preview
vim.keymap.set("n", "<leader>th", function()
    require("telescope.builtin").colorscheme({
        enable_preview = true,
        layout_strategy = "horizontal",
        layout_config = {
            anchor = "E",
            width = 0.45,
            height = 0.35,
            preview_width = 0.55,
        },
    })
end, { desc = "Theme Picker" })
        -- Language Servers
        vim.keymap.set("n", "<leader>lsd", builtin.lsp_definitions, options)
        vim.keymap.set("n", "<leader>lsi", builtin.lsp_implementations, options)
        --vim.keymap.set("n", "<leader>lsl", builtin.lsp_code_actions, options)
        vim.keymap.set("n", "<leader>lst", builtin.lsp_type_definitions, options)

        -- Extensions
        vim.keymap.set("n", "<leader>fn", function()
            telescope.extensions.notify.notify()
        end, options)
    end,
}
