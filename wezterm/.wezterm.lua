local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { 'C:/Program Files/Git/bin/bash.exe', '--login', '-i' }

config.enable_kitty_keyboard = true
config.color_scheme = 'rose-pine-moon'
config.colors = {
  selection_fg = '#1f1d2e',
  selection_bg = '#f6c177',
}
config.hide_tab_bar_if_only_one_tab = true

config.mouse_bindings = {
  -- disable auto-copy on releasing a text selection; use Ctrl+C to copy instead
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'NONE',
    action = wezterm.action.Nop,
  },
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'SHIFT',
    action = wezterm.action.Nop,
  },
}

wezterm.on('format-tab-title', function(tab)
  local cwd = tab.active_pane.current_working_dir
  if cwd then
    local path = cwd.file_path
    return path:gsub('[/\\]+$', ''):match('[^/\\]+$') or path
  end
  return tab.active_pane.title
end)

config.keys = {
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      local has_selection = window:get_selection_text_for_pane(pane) ~= ''
      if has_selection then
        window:perform_action(wezterm.action.CopyTo 'Clipboard', pane)
      else
        window:perform_action(wezterm.action.SendKey { key = 'c', mods = 'CTRL' }, pane)
      end
    end),
  },
  { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 't', mods = 'CTRL', action = wezterm.action.SpawnTab 'CurrentPaneDomain' },
  {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      if #pane:tab():panes() > 1 then
        window:perform_action(wezterm.action.CloseCurrentPane { confirm = false }, pane)
      else
        window:perform_action(wezterm.action.CloseCurrentTab { confirm = false }, pane)
      end
    end),
  },
  { key = '1', mods = 'CTRL', action = wezterm.action.ActivateTab(0) },
  { key = '2', mods = 'CTRL', action = wezterm.action.ActivateTab(1) },
  { key = '3', mods = 'CTRL', action = wezterm.action.ActivateTab(2) },
  { key = '4', mods = 'CTRL', action = wezterm.action.ActivateTab(3) },
  { key = '5', mods = 'CTRL', action = wezterm.action.ActivateTab(4) },
  { key = '6', mods = 'CTRL', action = wezterm.action.ActivateTab(5) },
  { key = '7', mods = 'CTRL', action = wezterm.action.ActivateTab(6) },
  { key = '8', mods = 'CTRL', action = wezterm.action.ActivateTab(7) },
  { key = '9', mods = 'CTRL', action = wezterm.action.ActivateTab(8) },
  { key = 'Backspace', mods = 'CTRL',   action = wezterm.action.SendString '\x17' },
  { key = 'Backspace', mods = 'ALT',    action = wezterm.action.SendString '\x15' },
  { key = 'Delete',   mods = 'CTRL',   action = wezterm.action.SendString '\x1bd' },
  { key = 's', mods = 'ALT',           action = wezterm.action.SplitPane { direction = 'Left' } },
  { key = 'd', mods = 'ALT',           action = wezterm.action.SplitPane { direction = 'Right' } },
  { key = 'd', mods = 'ALT|SHIFT',     action = wezterm.action.SplitPane { direction = 'Down' } },
  { key = 's', mods = 'ALT|SHIFT',     action = wezterm.action.SplitPane { direction = 'Up' } },
  { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
  { key = ']', mods = 'ALT', action = wezterm.action.ActivateTabRelative(1) },
  { key = '[', mods = 'ALT', action = wezterm.action.ActivateTabRelative(-1) },
}

return config
