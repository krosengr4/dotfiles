#!/bin/bash

# Query all windows with workspace info from aerospace
WINDOWS=$(aerospace list-windows --all --json --format '%{workspace} %{app-name}' 2>/dev/null)

if [ -z "$WINDOWS" ] || [ "$WINDOWS" = "[]" ]; then
  exit 0
fi

# Get unique workspaces
WORKSPACES=$(echo "$WINDOWS" | jq -r '.[].workspace' | sort -u)

while read -r workspace; do
  # Build apps object: {"AppName": 1, ...}
  APPS=$(echo "$WINDOWS" | jq -c --arg ws "$workspace" \
    '[.[] | select(.workspace == $ws) | ."app-name"] | unique | map({(.): 1}) | add // {}')

  sketchybar --trigger space_windows_change "INFO={\"space\":\"$workspace\",\"apps\":$APPS}"
done <<< "$WORKSPACES"
