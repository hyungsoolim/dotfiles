-- vim-tmux-navigator's own <C-h/j/k/l> mappings are superseded by
-- vim-herdr-navigation below; must be set before vim.pack.add() loads it,
-- since vim.pack defers "opt" plugin loading past this script.
vim.g.tmux_navigator_no_mappings = 1

vim.pack.add({
    -- "https://github.com/projekt0n/github-nvim-theme",
    "https://github.com/rktjmp/lush.nvim",
    "https://github.com/zenbones-theme/zenbones.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/christoomey/vim-tmux-navigator",
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/stevearc/conform.nvim",
    "https://github.com/OXY2DEV/markview.nvim",
    "https://github.com/paulbkim-dev/vim-herdr-navigation",
    -- { src="https://github.com/mikavilpas/yazi.nvim", name="yazi" }
})

--- vim-herdr-navigation ---
-- <C-h/j/k/l>: move between Neovim splits; at a split edge, hand off to
-- herdr (or tmux, or plain wincmd) to cross into the next pane.
dofile(vim.fn.stdpath("data") .. "/site/pack/core/opt/vim-herdr-navigation/editor/nvim.lua")

-----------
--- mini
-----------
require("mini.basics").setup({
    options = {
        basic = true,
        extra_ui = true,
    },
    mappings = {
        windows = true,
    }
})

--- mini ai ---
require("mini.ai").setup({})

--- mini files
local MiniFiles = require("mini.files")
MiniFiles.setup({
    windows = { preview = true },
    mappings = {
        go_in_plus = "<CR>"
    }
})

vim.keymap.set("n", "<leader>ed", "<cmd>lua MiniFiles.open()<CR>", { desc = "Explorer (root dir)" })
vim.keymap.set("n", "<leader>ef", "<Cmd>lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>",
    { desc = "Explorer (cwd)" })
local map_split = function(buf_id, lhs, direction)
    local rhs = function()
        -- 현재 target window 기준으로 새 split 생성
        local cur_target = MiniFiles.get_explorer_state().target_window
        local new_target = vim.api.nvim_win_call(cur_target, function()
            vim.cmd(direction .. " split")
            return vim.api.nvim_get_current_win()
        end)
        MiniFiles.set_target_window(new_target)
        MiniFiles.go_in({ close_on_file = false })
    end
    vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = "Split " .. direction })
end

vim.api.nvim_create_autocmd("User", {
    pattern = "MiniFilesBufferCreate",
    callback = function(args)
        map_split(args.data.buf_id, "<C-s>", "belowright horizontal")
        map_split(args.data.buf_id, "<C-v>", "belowright vertical")
    end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    vim.keymap.set("n", "gz", function()
      local entry = MiniFiles.get_fs_entry()
      if entry and entry.fs_type == "file" then
        vim.fn.jobstart({ "zed", entry.path }, { detach = true })
      end
    end, { buffer = buf_id, desc = "Open with Zed" })
  end,
})

--- mini notify
local MiniNotify = require("mini.notify")
MiniNotify.setup({
    -- only show messages
    content = {
        format = function(notif)
            return notif.msg
        end,
    },
})

-- mini cmdline completion
local MiniCmdline = require("mini.cmdline")
MiniCmdline.setup({})

-- mini surround
local MiniSurround = require("mini.surround")
MiniSurround.setup({})
-- Default Keymaps
-- | `sa` | Add surrounding or Direct with 'saiw' |
-- | `sd` | Delete surrounding |
-- | `sr` | Replace surrounding |
-- | `sf` | Find surrounding (right) |
-- | `sF` | Find surrounding (left) |
-- | `sh` | Highlight surrounding |
-- | `sn` | Update n_lines |
-- | `l` / `n` | as suffix for prev/next |

--- mini picker ---
local MiniPick = require("mini.pick")
local MiniExtra = require("mini.extra")
MiniPick.setup({})
MiniExtra.setup({})

--- mini completions ---
require("mini.completion").setup({
    lsp_completion = {
        auto_setup = true,
    }
})

--- mini pairs ---
require("mini.pairs").setup({})

--- mini clue ---
local miniclue = require("mini.clue")
miniclue.setup({
    triggers = {
        -- Leader triggers
        { mode = { 'n', 'x' }, keys = '<Leader>' },

        -- `[` and `]` keys
        { mode = 'n',          keys = '[' },
        { mode = 'n',          keys = ']' },

        -- Built-in completion
        { mode = 'i',          keys = '<C-Space>' },

        -- `g` key
        { mode = { 'n', 'x' }, keys = 'g' },

        -- Marks
        { mode = { 'n', 'x' }, keys = "'" },
        { mode = { 'n', 'x' }, keys = '`' },

        -- Registers
        { mode = { 'n', 'x' }, keys = '"' },
        { mode = { 'i', 'c' }, keys = '<C-r>' },

        -- Window commands
        { mode = 'n',          keys = '<C-w>' },

        -- `z` key
        { mode = { 'n', 'x' }, keys = 'z' },
    },

    clues = {
        {
            { mode = 'n', keys = '<Leader>b', desc = '+Buffer' },
            { mode = 'n', keys = '<Leader>e', desc = '+Explore/Edit' },
            { mode = 'n', keys = '<Leader>f', desc = '+Find' },
            { mode = 'n', keys = '<Leader>g', desc = '+Git' },
            { mode = 'n', keys = '<Leader>l', desc = '+Language' },
            { mode = 'n', keys = '<Leader>m', desc = '+Map' },
            { mode = 'n', keys = '<Leader>o', desc = '+Other' },
            { mode = 'n', keys = '<Leader>s', desc = '+Session' },
            -- { mode = 'n', keys = '<Leader>t', desc = '+Terminal' },
            { mode = 'n', keys = '<Leader>v', desc = '+Visits' },

            { mode = 'x', keys = '<Leader>g', desc = '+Git' },
            { mode = 'x', keys = '<Leader>l', desc = '+Language' },
        },
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.square_brackets(),
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
    },
    window = {
        delay = 100,
        config = {
            width = "auto"
        }
    }
})

--- mini git ---
require("mini.git").setup({})
require("mini.diff").setup({})

--- mini sessions ---
require("mini.sessions").setup({})

--- mini visits ---
require("mini.visits").setup({})

--- mini map ---
local MiniMap = require("mini.map")
MiniMap.setup({
    integrations = {
        MiniMap.gen_integration.builtin_search(),
        MiniMap.gen_integration.diagnostic({
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
        }),
        MiniMap.gen_integration.gitsigns(),
    },
    symbols = {
        encode = MiniMap.gen_encode_symbols.dot("4x2"),
    },
    -- window = {
    --   focusable = true,
    -- },
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- 약간의 딜레이 후 열기 (다른 플러그인 로딩 대기)
        vim.defer_fn(function()
            MiniMap.open()
        end, 100)
    end,
})


--- mini icons ---
require("mini.icons").setup({})

--- mini statusline ---
require("mini.statusline").setup({})
require("mini.tabline").setup({})
require("mini.indentscope").setup({})
require("mini.starter").setup({})

--- theme ---
-- require("github-theme").setup({
--     options = {
--         dim_inactive = true,
--         styles = {
--             comments = "italic",
--             types = "italic",
--             functions = "italic"
--         }
--     }
-- })
-- require("catppuccin").setup({
--     flavour = "auto",
--     dim_inactive = {
--         enabled = true,
--     },
-- })

--- conform ---
require('conform').setup({
    default_format_opts = {
        -- Allow formatting from LSP server if no dedicated formatter is available
        lsp_format = 'fallback',
    },
    -- Map of filetype to formatters
    -- Make sure that necessary CLI tool is available
    -- formatters_by_ft = { lua = { 'stylua' } },
})

--- markview ---
require("markview").setup({})
