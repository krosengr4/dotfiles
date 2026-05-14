return {
    'stevearc/conform.nvim',
    event = 'BufWritePre',
    opts = {
        formatters_by_ft = {
            html = { 'prettier' },
            css = { 'prettier' },
            javascript = { 'prettier' },
            typescript = { 'prettier' },
            json = { 'prettier' },
        },
        format_on_save = {
            timeout_ms = 2000,
            lsp_fallback = false,
        },
    },
}
