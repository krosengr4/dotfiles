-- This file should return a list/table of plugins
return {
  {
    'catppuccin/nvim',
    name = 'catppuccin', -- Important name for lazy.nvim
    lazy = false,       -- Load immediately
    priority = 1000,    -- Ensure it loads before others

    -- This 'opts' table holds the configuration for Catppuccin
    opts = {
      -- 🌟 THIS IS THE KEY LINE FOR MOCHA 🌟
      flavour = 'mocha', 

      transparent_background = true, -- Set to true if you want your terminal background to show through
      integrations = {
        -- Set to true for any other plugins you might use (e.g., nvim-cmp, gitsigns, etc.)
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        -- You can add more integrations here as you add more plugins
      },
    },

    -- This 'config' function runs after the plugin is loaded
    config = function(_, opts)
      -- Set up Catppuccin with the options defined above
      require('catppuccin').setup(opts)
      
      -- 💡 ACTIVATE THE COLORSCHEME 💡
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}