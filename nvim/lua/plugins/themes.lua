-- This file should return a list/table of plugins
local function get_nvim_theme()
    local f = io.open(vim.fn.expand('~/.config/nvim/theme'), 'r')
    if not f then return nil end
    local theme = f:read('*l'):gsub('%s+$', '')
    f:close()
    return theme
end

local nvim_theme = get_nvim_theme() or 'moonbow'

return {
 {
    'rose-pine/neovim',
    name = 'rose-pine',
    lazy = false,
    priority = 1000,

    opts = {
      variant = 'moon',
      dark_variant = 'moon',
      dim_inactive_windows = false,
      extend_background_behind_borders = true,

      styles = {
        bold = true,
        italic = true,
        transparency = false,
      },

      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = { enabled = true },
      },
    },

    config = function(_, opts)
      require('rose-pine').setup(opts)
      if nvim_theme == 'rose-pine' then
        vim.cmd.colorscheme 'rose-pine'
      end
    end,
  },
 {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 999,
    opts = {
      style = 'night',
      transparent = false,
    },
    config = function(_, opts)
      require('tokyonight').setup(opts)
      if nvim_theme == 'tokyonight' then
        vim.cmd.colorscheme 'tokyonight'
      end
    end,
  },
  {
    'loctvl842/monokai-pro.nvim',
    lazy = false,
    priority = 999,
    config = function()
      require('monokai-pro').setup({
        filter = 'classic',
        transparent_background = true,
        background_clear = { 'float_win', 'telescope', 'which-key' },
      })
      if nvim_theme == 'monokai-pro' then
        vim.cmd.colorscheme 'monokai-pro'
      end
    end,
  },
  {
    'projekt0n/caret.nvim',
    lazy = false,
    priority = 999,
    config = function()
      if nvim_theme == 'caret' then
        require('caret').setup({
          options = {
            transparent = true,
            styles = {
              bold = true,
              italic = true,
            },
          },
        })
        vim.opt.background = 'dark'
      end
    end,
  },
  {
    'arturgoms/moonbow.nvim',
    lazy = false,
    priority = 999,
    config = function()
      require('moonbow').setup({
        options = {transparent = false },
      })
      if nvim_theme == 'moonbow' then
        vim.cmd.colorscheme 'moonbow'
      end
    end,
  },
  {
    'vimcolorschemes/olive-crt.nvim',
    lazy = false,
    priority = 999,
    config = function()
      if nvim_theme == 'olive-crt' then
        require('olive_crt').setup({})
        vim.cmd.colorscheme 'olive-crt'
      end
    end,
  },
  {
    'savq/melange-nvim',
    lazy = false,
    priority = 999,
    config = function()
      if nvim_theme == 'melange' then
        vim.opt.background = 'light'
        vim.cmd.colorscheme 'melange'

        -- Remove italics from all highlight groups
        for _, group in ipairs(vim.fn.getcompletion('', 'highlight')) do
          local hl = vim.api.nvim_get_hl(0, { name = group, link = false })
          if hl.italic then
            hl.italic = false
            vim.api.nvim_set_hl(0, group, hl)
          end
        end

        -- Transparency
        local transparent_groups = {
          'Normal', 'NormalNC', 'NormalFloat', 'SignColumn',
          'FoldColumn', 'EndOfBuffer', 'LineNr', 'CursorLineNr',
        }
        for _, g in ipairs(transparent_groups) do
          vim.api.nvim_set_hl(0, g, { bg = 'NONE' })
        end
      end
    end,
  },
}
