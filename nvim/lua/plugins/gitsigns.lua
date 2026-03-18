return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      signs = {
        add          = { text = '▎' },
        change       = { text = '▎' },
        delete       = { text = '▁' },
        topdelete    = { text = '▔' },
        changedelete = { text = '▎' },
        untracked    = { text = '▎' },
      },
      current_line_blame = false, -- toggle with <leader>gb
    },
    keys = {
      { ']h', function() require('gitsigns').next_hunk() end,        desc = 'Next hunk' },
      { '[h', function() require('gitsigns').prev_hunk() end,        desc = 'Prev hunk' },
      { '<leader>hs', function() require('gitsigns').stage_hunk() end,   desc = 'Stage hunk' },
      { '<leader>hr', function() require('gitsigns').reset_hunk() end,   desc = 'Reset hunk' },
      { '<leader>gd', function() require('gitsigns').preview_hunk() end, desc = 'Preview hunk' },
      { '<leader>gb', function() require('gitsigns').toggle_current_line_blame() end, desc = 'Toggle blame' },
    },
  },
}
