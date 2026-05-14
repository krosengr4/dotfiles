-- This file should return a list/table of plugins

local function get_ghostty_theme()
  local config = vim.fn.expand('~/.config/ghostty/config')
  local f = io.open(config, 'r')
  if not f then return nil end
  local theme = nil
  for line in f:lines() do
    local t = line:match('^theme%s*=%s*(.+)$')
    if t then theme = t:gsub('%s+$', '') end
  end
  f:close()
  return theme
end

local ghostty_theme = get_ghostty_theme()

local theme_map = {
  ['Rose Pine Moon'] = 'rose-pine',
  ['Homebrew']       = 'caret',
  ['Ciapre']         = 'tokyonight',
  ['glacier']        = 'nightfox',
  ['fahrenheit']     = 'gruvbox-material',
  ['Sea Shells']     = 'oceanic-next',
  ['Novel']          = 'melange',
}

local nvim_theme = theme_map[ghostty_theme] or 'rose-pine'

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
        transparency = true,
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
    'mhartington/oceanic-next',
    lazy = false,
    priority = 999,
    config = function()
      vim.g.oceanic_next_terminal_bold = 1
      vim.g.oceanic_next_terminal_italic = 1
      if nvim_theme == 'oceanic-next' then
        vim.cmd.colorscheme 'OceanicNext'
        local groups = { 'Normal', 'NormalNC', 'NormalFloat', 'SignColumn', 'FoldColumn', 'EndOfBuffer', 'LineNr', 'CursorLineNr' }
        for _, g in ipairs(groups) do
          vim.api.nvim_set_hl(0, g, { bg = 'NONE' })
        end
      end
    end,
  },
  {
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 999,
    config = function()
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_transparent_background = 1
      if nvim_theme == 'gruvbox-material' then
        vim.cmd.colorscheme 'gruvbox-material'
      end
    end,
  },
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    priority = 999,
    config = function()
      require('nightfox').setup({
        options = { transparent = false },
      })
      if nvim_theme == 'nightfox' then
        vim.cmd.colorscheme 'nightfox'
      end
    end,
  },
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 999,
    opts = {
      style = 'night',
      transparent = true,
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
      require('caret').setup({
        options = {
          transparent = true,
          styles = {
            bold = true,
            italic = true,
          },
        },
      })
      if nvim_theme == 'caret' then
        vim.opt.background = 'dark'
        vim.cmd.colorscheme 'caret'
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
