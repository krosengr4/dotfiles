vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP hover docs' })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code actions' })

vim.lsp.config('gopls', {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork' },
    root_markers = { 'go.work', 'go.mod', '.git' },
})
vim.lsp.enable('gopls')

-- Auto-organize imports and format on save for Go files
vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("GoLsp", { clear = true }),
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        for _, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})

return {}
