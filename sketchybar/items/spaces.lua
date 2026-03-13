local colors = require("colors")
local settings = require("settings")

local WORKSPACES = { "1", "2", "3", "4", "E", "Q", "R", "W" }

sbar.add("event", "aerospace_workspace_change")

local spaces = {}

for _, ws in ipairs(WORKSPACES) do
  local space = sbar.add("item", "space." .. ws, {
    icon = {
      font = { family = settings.font.numbers },
      string = ws,
      padding_left = 15,
      padding_right = 8,
      color = colors.black,
      highlight_color = colors.red,
    },
    label = { drawing = false },
    padding_right = 1,
    padding_left = 1,
    background = {
      color = colors.bg1,
      border_width = 1,
      height = 26,
      border_color = colors.black,
    },
    click_script = "aerospace workspace " .. ws,
  })

  spaces[ws] = space

  local space_bracket = sbar.add("bracket", { space.name }, {
    background = {
      color = colors.transparent,
      border_color = colors.bg2,
      height = 28,
      border_width = 2,
    }
  })

  sbar.add("item", "space.padding." .. ws, {
    width = settings.group_paddings,
  })

  space:subscribe("aerospace_workspace_change", function(env)
    local selected = env.FOCUSED_WORKSPACE == ws
    space:set({
      icon = { highlight = selected },
      background = { border_color = selected and colors.black or colors.bg2 }
    })
    space_bracket:set({
      background = { border_color = selected and colors.grey or colors.bg2 }
    })
  end)
end

-- Highlight the current workspace on startup
sbar.exec("aerospace list-workspaces --focused", function(focused)
  local ws = focused:gsub("%s+", "")
  if spaces[ws] then
    spaces[ws]:set({
      icon = { highlight = true },
      background = { border_color = colors.black }
    })
  end
end)
