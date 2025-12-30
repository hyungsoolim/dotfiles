return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
    config = function(_, opts)
      local plugin = require("ibl")
      plugin.setup(opts)

      local highlight
    end,
  },
}
