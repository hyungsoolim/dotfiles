return {
  "catppuccin/nvim", 
  name = "catppuccin", 
  priority = 1000,
  config = function()
    require("catppuccin").setup({
    flavour = "mocha", -- Choose your flavour: latte, frappe, macchiato, mocha
    integrations = {
        -- Enable integrations for plugins you're using (optional)
        treesitter = true,
        lsp_trouble = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        nvimtree = true,
        which_key = true,
        -- Add other integrations if necessary
      },
    })

  -- Apply the colorscheme
  vim.cmd("colorscheme catppuccin")
  end,
}
