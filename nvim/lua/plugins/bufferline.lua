return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    -- after = "catppuccin",
    config = function()
      require("bufferline").setup({
        options = {
          numbers = "buffer_id",
          -- hightlights = require("catppuccin.special.bufferline").get_theme(),
          -- separator_style = "slant",
          indicator = {
            icon = "▎", -- this should be omitted if indicator style is not 'icon'
            style = "underline",
          },
          separator_style = "thick",
          diagnostics = "nvim_lsp",
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
            for e, n in pairs(diagnostics_dict) do
              local sym = e == "error" and " " or (e == "warning" and " " or " ")
              s = s .. n .. sym
            end
            return s
          end,
        },
      })
    end,
  },
}
