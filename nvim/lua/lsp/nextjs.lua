return {
  { import = "lazyvim.plugins.extras.lang.typescript.biome" },
  {
    "mason-org/mason.nvim",
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "biome-organize-imports", "biome" },
        javascriptreact = { "biome-organize-imports", "biome" },
        typescript = { "biome-organize-imports", "biome" },
        typescriptreact = { "biome-organize-imports", "biome" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        vtsls = {
          on_attach = function(client)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvier = false
          end,
        },
      },
    },
  },
}
