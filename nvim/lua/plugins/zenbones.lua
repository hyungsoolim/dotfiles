return {
  "zenbones-theme/zenbones.nvim",
  dependencies = "rktjmp/lush.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    local plugin = require("zenbones")
    plugin.setup(opts)

    vim.cmd.colorscheme("zenbones")
  end,
}
