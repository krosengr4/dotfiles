#!/bin/bash

WHITELIST="com.apple.Music com.spotify.client"

case $SENDER in
  mouse.entered)
    sketchybar --set media_artist label.width=dynamic \
               --set media_title  label.width=dynamic
    ;;
  mouse.exited)
    sketchybar --set media_artist label.width=0 \
               --set media_title  label.width=0
    ;;
  mouse.clicked)
    sketchybar --set media_cover popup.drawing=toggle
    ;;
  mouse.exited.global)
    sketchybar --set media_cover popup.drawing=off
    ;;
  *)
    if ! command -v nowplaying-cli &>/dev/null; then exit 0; fi

    APP=$(nowplaying-cli get client 2>/dev/null)
    STATE=$(nowplaying-cli get playbackStatus 2>/dev/null)
    TITLE=$(nowplaying-cli get title 2>/dev/null)
    ARTIST=$(nowplaying-cli get artist 2>/dev/null)

    if [ "$STATE" = "Playing" ] && echo "$WHITELIST" | grep -qw "$APP"; then
      sketchybar --set media_cover  drawing=on \
                 --set media_artist drawing=on label="$ARTIST" label.width=dynamic \
                 --set media_title  drawing=on label="$TITLE"  label.width=dynamic
    else
      sketchybar --set media_cover  drawing=off popup.drawing=off \
                 --set media_artist drawing=off \
                 --set media_title  drawing=off
    fi
    ;;
esac
