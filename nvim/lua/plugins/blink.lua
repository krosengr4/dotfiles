return {
    {
        'saghen/blink.cmp',
        version = '*',
        opts = {
            keymap = {
                preset = 'default',
                ['<Tab>'] = { 'select_next', 'fallback' },
                ['<S-Tab>'] = { 'select_prev', 'fallback' },
                ['<C-n>'] = { 'fallback' },
                ['<C-p>'] = { 'fallback' },
                ['<C-k>'] = {
                    function(cmp)
                        if cmp.is_documentation_visible() then
                            return cmp.hide_documentation()
                        end
                        return cmp.show_documentation()
                    end,
                    'fallback'
                },
            },
            completion = {
                documentation = {
                    auto_show = false,
                },
            },
            sources = {
                default = { 'lsp', 'path', 'buffer' },
            },
        },
    },
}
