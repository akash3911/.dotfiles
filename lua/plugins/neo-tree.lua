return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({})

      vim.keymap.set("n", "<leader>e", "<Cmd>Neotree filesystem toggle left<CR>", {
        desc = "Toggle Explorer",
        silent = true,
        noremap = true,
      })
    end,
  },
}