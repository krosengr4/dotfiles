#!/bin/bash

sketchybar \
  --add item wifi right \
  --set wifi \
        icon="􀙇" \
        label.drawing=off \
        script="$PLUGIN_DIR/wifi.sh" \
  --subscribe wifi wifi_change system_woke mouse.clicked mouse.exited.global \
  \
  --add bracket wifi.bracket wifi \
  --set wifi.bracket \
        background.color=$ITEM_BG_COLOR \
        popup.align=center \
        popup.height=30 \
  \
  --add item wifi.ssid right \
  --set wifi.ssid \
        position=popup.wifi.bracket \
        icon="􁓤" \
        icon.font="SF Pro:Bold:15.0" \
        width=250 \
        align=center \
        label="????????????" \
        label.font="SF Pro:Bold:15.0" \
        background.color=0xffffffff \
        click_script="$PLUGIN_DIR/copy_label.sh" \
  \
  --add item wifi.hostname right \
  --set wifi.hostname \
        position=popup.wifi.bracket \
        icon="Hostname:" \
        icon.align=left \
        icon.width=125 \
        label="????????????" \
        label.width=125 \
        label.align=right \
        background.color=0xffffffff \
        click_script="$PLUGIN_DIR/copy_label.sh" \
  \
  --add item wifi.ip right \
  --set wifi.ip \
        position=popup.wifi.bracket \
        icon="IP:" \
        icon.align=left \
        icon.width=125 \
        label="???.???.???.???" \
        label.width=125 \
        label.align=right \
        background.color=0xffffffff \
        click_script="$PLUGIN_DIR/copy_label.sh" \
  \
  --add item wifi.mask right \
  --set wifi.mask \
        position=popup.wifi.bracket \
        icon="Subnet mask:" \
        icon.align=left \
        icon.width=125 \
        label="???.???.???.???" \
        label.width=125 \
        label.align=right \
        background.color=0xffffffff \
        click_script="$PLUGIN_DIR/copy_label.sh" \
  \
  --add item wifi.router right \
  --set wifi.router \
        position=popup.wifi.bracket \
        icon="Router:" \
        icon.align=left \
        icon.width=125 \
        label="???.???.???.???" \
        label.width=125 \
        label.align=right \
        background.color=0xffffffff \
        click_script="$PLUGIN_DIR/copy_label.sh" \
  \
  --add item wifi.download right \
  --set wifi.download \
        position=popup.wifi.bracket \
        icon="􀄩 Download:" \
        icon.align=left \
        icon.width=125 \
        label="??? Bps" \
        label.width=125 \
        label.align=right \
        background.color=0xffffffff \
  \
  --add item wifi.upload right \
  --set wifi.upload \
        position=popup.wifi.bracket \
        icon="􀄨 Upload:" \
        icon.align=left \
        icon.width=125 \
        label="??? Bps" \
        label.width=125 \
        label.align=right \
        background.color=0xffffffff \
  \
#   --add item wifi.padding right \
#   --set wifi.padding width=100
