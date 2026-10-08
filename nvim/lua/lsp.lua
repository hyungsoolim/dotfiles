require("mason").setup({})

-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format Local buffer" })
-- vim.keymap.set("n", "df", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
--
vim.diagnostic.config({ virtual_text = true, underline = true, update_in_insert = true})
--
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("mini.completion").get_lsp_capabilities())

vim.lsp.config("*", { capabilities = capabilities })

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            diagnostics = { globals = { "vim" } },
        },
    },
})

-- 커서를 100ms 멈추면 같은 심볼의 선언/참조를 강조합니다.
vim.opt.updatetime = 100

local reference_group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = reference_group,
    desc = "Highlight references under cursor",
    callback = function(event)
        local clients = vim.lsp.get_clients({ bufnr = event.buf, method = "textDocument/documentHighlight" })
        if #clients > 0 then
            vim.lsp.buf.document_highlight()
        end
    end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "InsertEnter", "BufLeave", "LspDetach" }, {
    group = reference_group,
    desc = "Clear reference highlights",
    callback = function(event)
        vim.lsp.util.buf_clear_references(event.buf)
    end,
})

vim.lsp.enable({
    "lua_ls",
    "vtsls",
    "biome",
    "basedpyright",
    "ruff",
    "tailwindcss-language-server",
    -- "marksman",
    -- "gopls",
    -- "rust_analyzer",
})
