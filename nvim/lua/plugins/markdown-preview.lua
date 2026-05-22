return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_highlight_css = vim.fn.expand("~/.config/nvim/css/markdown-preview.css")
      vim.g.mkdp_auto_close = 0
      vim.g.mkdp_combine_preview = 0
      vim.g.mkdp_preview_options = {
        disable_sync_scroll = 1,
      }
    end,
  },
}
