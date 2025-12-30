return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
      },
    },
    config = function(_, opts)
      local plugin = require("catppuccin")
      plugin.setup(opts)

      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
