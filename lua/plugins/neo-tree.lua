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
      require("neo-tree").setup({
       window = {
          width = 20, -- Change this (default is around 40)
        },   
      })

      vim.keymap.set("n", "<leader>e", "<Cmd>Neotree filesystem toggle left<CR>", {
        desc = "Toggle Explorer",
        silent = true,
        noremap = true,
      })
    end,
  },
}
