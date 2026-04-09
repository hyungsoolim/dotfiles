return {
  -- gruvbox material theme -------------------------------------------
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme("gruvbox-material")
  --   end,
  -- },

  -- everforest theme -------------------------------------------
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- 다른 플러그인보다 먼저 로드
  --   config = function()
  --     require("everforest").setup({
  --       -- ── 배경 밝기 ───────────────────────────────────────────
  --       background = "hard", -- "soft" | "medium" | "hard"
  --       -- hard 추천 (nord처럼 흐릿한 거 싫으셨으니)
  --
  --       -- ── 투명 배경 ───────────────────────────────────────────
  --       transparent_background_level = 0,
  --       -- 0: 불투명 (기본)
  --       -- 1: Normal, NormalNC, NormalFloat만 투명
  --       -- 2: 사이드바, 팝업까지 모두 투명
  --
  --       -- ── Italic ──────────────────────────────────────────────
  --       italics = true, -- 주석, 키워드, 타입에 italic 적용
  --
  --       -- ── 대비 조정 ───────────────────────────────────────────
  --       disable_italic_comments = false, -- 주석 italic 유지
  --       sign_column_background = "none", -- "none" | "grey"
  --
  --       -- ── 진단(diagnostics) 스타일 ────────────────────────────
  --       diagnostic_text_highlight = false, -- true: 에러 줄 전체 강조
  --       diagnostic_virtual_text = "coloured", -- "coloured" | "grey"
  --
  --       -- ── UI 세부 조정 ─────────────────────────────────────────
  --       inlay_hints_background = "none", -- inlay hint 배경색
  --       ui_contrast = "low", -- "low" | "high"
  --       -- high: 사이드바·팝업 테두리 강조
  --
  --       -- ── Treesitter 컨텍스트 강조 ────────────────────────────
  --       dim_inactive_windows = true, -- 비활성 창 어둡게
  --
  --       -- ── 색상 오버라이드 (선택사항) ───────────────────────────
  --       -- on_highlights = function(hl, palette)
  --       --   hl.Comment = { fg = palette.grey1, italic = true }
  --       -- end,
  --     })
  --
  --     vim.cmd("colorscheme everforest")
  --   end,
  -- },
  -- github theme ------------------------------------------------------
  -- {
  --   "projekt0n/github-nvim-theme",
  --   name = "github-theme",
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("github-theme").setup({
  --       options = {
  --         dim_inactive = true,
  --         styles = {
  --           comments = "italic",
  --           -- keywords = "bold",
  --           types = "italic",
  --           functions = "italic",
  --         },
  --       },
  --     })
  --
  --     vim.cmd("colorscheme github_dark_dimmed")
  --   end,
  -- },
  -- gruvbox -----------------------------------------------------------
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   opts = {
  --     terminal_colors = true, -- add neovim terminal colors
  --     undercurl = true,
  --     underline = true,
  --     bold = true,
  --     italic = {
  --       strings = true,
  --       emphasis = true,
  --       comments = true,
  --       operators = false,
  --       folds = true,
  --     },
  --     strikethrough = true,
  --     invert_selection = false,
  --     invert_signs = false,
  --     invert_tabline = false,
  --     inverse = true, -- invert background for search, diffs, statuslines and errors
  --     contrast = "", -- can be "hard", "soft" or empty string
  --     palette_overrides = {},
  --     overrides = {},
  --     dim_inactive = true,
  --     transparent_mode = false,
  --   },
  --   config = function(_, opts)
  --     require("gruvbox").setup(opts)
  --
  --     vim.cmd("colorscheme gruvbox")
  --   end,
  -- },
  -- nightfox -------------------------------------------------------------
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          dim_inactive = true,
          styles = {
            comments = "italic",
            types = "italic",
          },
        },
      })

      vim.cmd("colorscheme carbonfox")
    end,
  },
}
