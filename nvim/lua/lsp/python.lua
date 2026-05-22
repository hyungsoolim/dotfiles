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
          settings = {
            basedpyright = {
              analysis = {
                autoImportCompletions = true,
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },

        -- 3. Ruff 설정 (Linting & Formatting)
        ruff = {
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

  -- 4. 저장 시 Ruff로 Organize Imports 자동 실행
  -- init은 opts 머지를 깨지 않으면서 플러그인 로드 전에 실행됨.
  {
    "neovim/nvim-lspconfig",
    opts = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function(args)
          local clients = vim.lsp.get_clients({ name = "ruff", bufnr = args.buf })
          if #clients > 0 then
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
