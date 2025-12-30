return {
  -- 1. Mason을 통해 basedpyright 설치 보장
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "basedpyright" },
    },
  },

  {
    -- 2. LSP 설정: Pyright 끄고 BasedPyright 켜기
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- LazyVim 기본 pyright 비활성화 (충돌 방지)
        pyright = { enabled = false },

        -- basedpyright 활성화
        basedpyright = {
          enabled = true,
          -- pyproject.toml의 [tool.pyright] 설정을 자동으로 읽습니다.
          -- basedpyright는 pyright의 포크이므로 호환됩니다.
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
                -- 필요하다면 여기서 강제 설정을 할 수 있지만,
                -- 님의 경우 pyproject.toml에 다 있어서 비워도 됩니다.
                -- typeCheckingMode = "standard",
              },
            },
          },
        },

        -- 3. Ruff 설정 (Linting & Formatting)
        ruff = {
          -- Ruff도 pyproject.toml의 [tool.ruff]를 자동 인식합니다.
          -- VSCode의 "source.organizeImports.ruff" 기능을 위해 키매핑 추가
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports (Ruff)",
            },
          },
        },
      },
    },
  },
  -- 4. 저장할 때 자동으로 Organize Imports 실행 (VSCode 동작 재현)
  -- 원하지 않으면 이 블록은 빼셔도 됩니다.
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function(args)
          -- Ruff LSP가 붙어있을 때만 실행
          local client = vim.lsp.get_active_clients({ name = "ruff", bufnr = args.buf })[1]
          if client then
            vim.lsp.buf.code_action({
              apply = true,
              context = {
                only = { "source.organizeImports" },
                diagnostics = {},
              },
              bufnr = args.buf,
            })
          end
        end,
      })
    end,
  },
}
