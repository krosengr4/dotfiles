return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        defaults = {
          preview = {
            treesitter = false,
          },
          mappings = {
            i = {
              ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
            },
            n = {
              ["<C-q>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
            },
          },
        },
      })

      local builtin = require('telescope.builtin')

      -- Find files by name
      vim.keymap.set('n', '<leader>ff', function()
        builtin.find_files({ hidden = true })
      end, { desc = 'Find files' })

      -- Search inside file contents
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })

      -- Switch between open buffers
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })

      -- Search recently opened files
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Recent files' })
    end,
  },
}
