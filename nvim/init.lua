require("vim._core.ui2").enable({})

require("options")
require("keymaps")
require("pack")
-- require("commands")
require("treesitter")
require("lsp")

-- zenbones config
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.g.zenbones = {
    -- windows & background
    lighten_noncurrent_window = true,

    -- border & text style
    colorize_diagnostic_underline_text = true,

    -- elements brightness
    lighten_cursor_line = 8
}
vim.cmd.colorscheme("zenbones")
