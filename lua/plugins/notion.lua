return {
    'ALT-F4-LLC/notion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
    },
    opts = {
        database_id = '21f1a19994538010a449f9026b0e8552',
        notion_token_cmd = { 'doppler', 'secrets', '--project', 'erikreinert', '--config', 'mac17-7', 'get', '--plain', 'NOTION_TOKEN' }
    },
    config = function(_, opts)
        require('notion').setup(opts)

        local options = { noremap = true, silent = true }

        vim.keymap.set('n', '<leader>eb', '<CMD>NotionBrowser<CR>', options)
        vim.keymap.set('n', '<leader>ee', '<CMD>NotionEdit<CR>', options)
    end,
}
