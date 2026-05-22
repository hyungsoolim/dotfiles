return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "markdownlint-cli2" },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        markdown = {},
        ["markdown.mdx"] = {},
      },
    },
  },
}
