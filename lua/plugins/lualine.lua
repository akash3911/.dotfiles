return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "tokyonight",
      extensions = { "fzf", "quickfix" },
    },

    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        {
          "branch",
          icon = "",
        },
        "diff",
        "diagnostics",
      },
      lualine_c = { "filename" },

      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
  },

  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}

