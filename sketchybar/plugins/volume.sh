#!/bin/sh

case $SENDER in
  volume_change)
    VOLUME=$INFO

    case $VOLUME in
      [6-9][0-9]|100) ICON="􀊩"
      ;;
      [3-5][0-9]) ICON="􀊥"
      ;;
      [1-9]|[1-2][0-9]) ICON="􀊡"
      ;;
      *) ICON="􀊣"
    esac

    sketchybar --set $NAME icon="$ICON" label="$VOLUME%" \
               --set volume.slider slider.percentage=$VOLUME
  ;;
  mouse.clicked)
    sketchybar --set volume popup.drawing=toggle
  ;;
  mouse.exited.global)
    sketchybar --set volume popup.drawing=off
  ;;
esac
