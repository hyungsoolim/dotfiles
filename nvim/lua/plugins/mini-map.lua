return {
  {
    "nvim-mini/mini.map",
    version = false,
    config = function()
      local plugin = require("mini.map")
      plugin.setup({
        integrations = {
          plugin.gen_integration.builtin_search(),
          plugin.gen_integration.diagnostic({
            error = "DiagnosticFloatingError",
            warn = "DiagnosticFloatingWarn",
            info = "DiagnosticFloatingInfo",
            hint = "DiagnosticFloatingHint",
          }),
          plugin.gen_integration.gitsigns(),
        },
        symbols = {
          encode = plugin.gen_encode_symbols.dot("4x2"),
        },
        window = {
          focusable = true,
        },
      })

      -- 키매핑 설정
      vim.keymap.set("n", "<leader>mc", plugin.close, { desc = "Close minimap" })
      vim.keymap.set("n", "<leader>mf", plugin.toggle_focus, { desc = "Focus/unfocus minimap" })
      vim.keymap.set("n", "<leader>mo", plugin.open, { desc = "Open minimap" })
      vim.keymap.set("n", "<leader>mr", plugin.refresh, { desc = "Refresh minimap" })
      vim.keymap.set("n", "<leader>ms", plugin.toggle_side, { desc = "Toggle minimap side" })
      vim.keymap.set("n", "<leader>mt", plugin.toggle, { desc = "Toggle minimap" })

      -- 검색 후 자동 refresh를 위한 키매핑 (선택사항)
      for _, key in ipairs({ "n", "N", "*", "#" }) do
        local rhs = key .. "<Cmd>lua MiniMap.refresh({}, {lines = false, scrollbar = false})<CR>"
        vim.keymap.set("n", key, rhs, { desc = "Search " .. key .. " with map refresh" })
      end

      -- Neovim 시작 시 자동으로 minimap 열기
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          -- 약간의 딜레이 후 열기 (다른 플러그인 로딩 대기)
          vim.defer_fn(function()
            plugin.open()
          end, 100)
        end,
      })
    end,
  },
}
