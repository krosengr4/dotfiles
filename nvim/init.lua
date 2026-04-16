-- ~/.config/nvim/init.lua

-- ====================================================================
-- BOOTSTRAP LAZY.NVIM (KEEP THIS BLOCK AT THE VERY TOP)
-- ====================================================================
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before lazy
vim.g.mapleader = ' '

-- ====================================================================
-- PLUGIN MANAGER SETUP (Call setup ONLY ONCE!)
-- ====================================================================
require('lazy').setup({
    -- This table tells lazy.nvim to load all the plugins defined
    -- in the 'lua/plugins/' directory, which is where your themes.lua should be.
    { import = 'plugins' },
}, {})
-- If your themes.lua is NOT in a `lua/plugins/` directory,
-- you would use: `require('lazy').setup(require('themes'))` instead.


-- ====================================================================
-- BASIC EDITOR SETTINGS (Keep your existing settings here)
-- ====================================================================

-- Set the leader key to a space
vim.g.mapleader = ' '

-- Enable syntax highlighting
vim.cmd.syntax('on')

-- Set background for better theme rendering (usually 'dark' or 'light')
vim.opt.background = 'dark' 

-- Enable line numbers (absolute and relative)
vim.opt.number = true
vim.opt.relativenumber = true

-- Set the tab size and auto-indent settings
vim.opt.tabstop = 4     
vim.opt.shiftwidth = 4  
vim.opt.expandtab = true

-- Better navigation
vim.opt.wrap = false    
vim.opt.smartindent = true 

-- Better searching
vim.opt.incsearch = true  
vim.opt.hlsearch = true   

-- Mouse support
vim.opt.mouse = 'a'     

-- Keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic' })
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', { desc = 'Paste from clipboard' })
vim.api.nvim_create_user_command('DiffOrig', function()                                                                                                      local ft = vim.bo.filetype
    vim.cmd('vnew | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis')                                                                        vim.bo.filetype = ft
end, {})

-- Enable system clipboard
vim.opt.clipboard = "unnamedplus"

-- Cmd+C to copy (visual mode)
vim.keymap.set("v", "<D-c>", '"+y')

-- Cmd+V to paste (normal, visual, insert modes)
vim.keymap.set("n", "<D-v>", '"+p')
vim.keymap.set("v", "<D-v>", '"+p')
vim.keymap.set("i", "<D-v>", '<C-r>+')

-- Option+Backspace: delete previous word (insert mode)
vim.keymap.set("i", "<M-BS>", "<C-w>", { desc = "Delete previous word" })

-- Cmd+Backspace: delete to beginning of line (insert mode)
vim.keymap.set("i", "<D-BS>", "<C-u>", { desc = "Delete to beginning of line" })

-- Option+Delete: forward delete one word (insert mode)
vim.keymap.set("i", "<M-Del>", "<C-o>dw", { desc = "Forward delete word" })

-- Cmd+Delete: forward delete to end of line (insert mode)
vim.keymap.set("i", "<D-Del>", "<C-o>D", { desc = "Forward delete to end of line" })

-- Option+Left/Right: move one word back/forward (insert mode)
-- Terminal sends ESC+b / ESC+f (readline word-movement sequences)
vim.keymap.set("i", "<M-b>", "<C-Left>", { desc = "Move back one word" })
vim.keymap.set("i", "<M-f>", "<C-Right>", { desc = "Move forward one word" })

-- Cmd+Left/Right: move to beginning/end of line (insert mode)
-- Terminal sends Ctrl+A / Ctrl+E (readline line-movement sequences)
vim.keymap.set("i", "<C-a>", "<Home>", { desc = "Move to beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "Move to end of line" })

-- Move lines up/down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
