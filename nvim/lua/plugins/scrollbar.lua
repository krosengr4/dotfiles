return {
  {
    'petertriho/nvim-scrollbar',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = { 'lewis6991/gitsigns.nvim' },
    opts = {
      handlers = {
        gitsigns = true,
        cursor   = false,
        search   = false,
      },
    },
  },
}
