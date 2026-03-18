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
  ['Homebrew']       = 'bamboo',
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
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 999,
    config = function()
      require('bamboo').setup({
        style = 'multiplex',
        highlights = {
          Normal        = { bg = '#000000' },
          NormalNC      = { bg = '#000000' },
          NormalFloat   = { bg = '#000000' },
          SignColumn    = { bg = '#000000' },
          FoldColumn    = { bg = '#000000' },
          EndOfBuffer   = { bg = '#000000' },
        },
      })
      if nvim_theme == 'bamboo' then
        vim.cmd.colorscheme 'bamboo'
      end
    end,
  },
}
