#!/bin/bash

sketchybar \
  --add item media_cover e \
  --set media_cover \
        background.image=media.artwork \
        background.image.scale=0.85 \
        background.color=0x00000000 \
        label.drawing=off \
        icon.drawing=off \
        drawing=off \
        updates=on \
        update_freq=5 \
        popup.align=center \
        popup.horizontal=on \
        script="$PLUGIN_DIR/media.sh" \
  --subscribe media_cover media_change mouse.entered mouse.exited mouse.clicked \
  \
  --add item media_artist e \
  --set media_artist \
        drawing=off \
        padding_left=3 \
        padding_right=0 \
        width=0 \
        icon.drawing=off \
        label.width=0 \
        label.font="SF Pro:Semibold:9.0" \
        label.color=0x99ffffff \
        label.max_chars=18 \
        label.y_offset=6 \
  \
  --add item media_title e \
  --set media_title \
        drawing=off \
        padding_left=3 \
        padding_right=0 \
        icon.drawing=off \
        label.width=0 \
        label.font="SF Pro:Semibold:11.0" \
        label.max_chars=16 \
        label.y_offset=-5 \
        script="$PLUGIN_DIR/media.sh" \
  --subscribe media_title mouse.exited.global \
  \
  --add item media.back popup.media_cover \
  --set media.back \
        icon="􀊊" \
        label.drawing=off \
        click_script="nowplaying-cli previous" \
  \
  --add item media.play_pause popup.media_cover \
  --set media.play_pause \
        icon="􀊈" \
        label.drawing=off \
        click_script="nowplaying-cli togglePlayPause" \
  \
  --add item media.forward popup.media_cover \
  --set media.forward \
        icon="􀊌" \
        label.drawing=off \
        click_script="nowplaying-cli next"
