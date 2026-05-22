return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            exclude = { ".git", "node_modules", "__pycache__" },
            win = {
              list = {
                keys = {},
              },
            },
          },
        },
      },
    },
    keys = {
      -- default keymap disable
      { "<leader>e", false },
      { "<leader>E", false },
      -- new keymap
      {
        "<leader>ee",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer (root dir)",
      },
      {
        "<leader>eE",
        function()
          Snacks.explorer({ cwd = false })
        end,
        desc = "Explorer (cwd)",
      },
    },
  },
}
