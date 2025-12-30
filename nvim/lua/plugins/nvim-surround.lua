return {
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      local plugin = require("nvim-surround")
      plugin.setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
