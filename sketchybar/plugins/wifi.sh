#!/bin/bash

source "$CONFIG_DIR/colors.sh"

INTERFACE="en0"

format_speed() {
  local bytes=$1
  if [ "$bytes" -ge 1073741824 ]; then
    printf "%03d GBps" $((bytes / 1073741824))
  elif [ "$bytes" -ge 1048576 ]; then
    printf "%03d MBps" $((bytes / 1048576))
  elif [ "$bytes" -ge 1024 ]; then
    printf "%03d KBps" $((bytes / 1024))
  else
    printf "%03d Bps" "$bytes"
  fi
}

case $SENDER in
  mouse.clicked)
    DRAWING=$(sketchybar --query wifi.bracket | python3 -c "import sys,json; print(json.load(sys.stdin)['popup']['drawing'])")
    if [ "$DRAWING" = "off" ]; then
      SSID=$(ipconfig getsummary $INTERFACE | awk -F ' SSID : ' '/ SSID : / {print $2}')
      HOSTNAME=$(networksetup -getcomputername)
      IP=$(ipconfig getifaddr $INTERFACE)
      MASK=$(networksetup -getinfo Wi-Fi | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}')
      ROUTER=$(networksetup -getinfo Wi-Fi | awk -F 'Router: ' '/^Router: / {print $2}')
      sketchybar --set wifi.ssid      label="${SSID:-N/A}" \
                 --set wifi.hostname  label="${HOSTNAME:-N/A}" \
                 --set wifi.ip        label="${IP:-N/A}" \
                 --set wifi.mask      label="${MASK:-N/A}" \
                 --set wifi.router    label="${ROUTER:-N/A}" \
                 --set wifi.download  label="..." \
                 --set wifi.upload    label="..." \
                 --set wifi.bracket   popup.drawing=on
      (
        STATS1=$(netstat -ib | grep "^$INTERFACE " | head -1)
        sleep 1
        STATS2=$(netstat -ib | grep "^$INTERFACE " | head -1)
        UP_DELTA=$(( $(echo "$STATS2" | awk '{print $10}') - $(echo "$STATS1" | awk '{print $10}') ))
        DOWN_DELTA=$(( $(echo "$STATS2" | awk '{print $7}') - $(echo "$STATS1" | awk '{print $7}') ))
        [ "$UP_DELTA" -lt 0 ] && UP_DELTA=0
        [ "$DOWN_DELTA" -lt 0 ] && DOWN_DELTA=0
        sketchybar --set wifi.download label="$(format_speed "$DOWN_DELTA")" \
                   --set wifi.upload   label="$(format_speed "$UP_DELTA")"
      ) &
    else
      sketchybar --set wifi.bracket popup.drawing=off
    fi
    ;;
  mouse.exited.global)
    sketchybar --set wifi.bracket popup.drawing=off
    ;;
  wifi_change|system_woke)
    IP=$(ipconfig getifaddr $INTERFACE)
    if [ -n "$IP" ]; then
      sketchybar --set wifi icon="􀙇" icon.color=$ICON_COLOR
    else
      sketchybar --set wifi icon="􀙈" icon.color=0xfff38ba8
    fi
    ;;
esac
