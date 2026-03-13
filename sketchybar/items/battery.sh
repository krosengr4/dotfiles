#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         script="$PLUGIN_DIR/battery.sh" \
                         popup.align=center \
           --subscribe battery system_woke power_source_change mouse.clicked \
           --add item battery.remaining right \
           --set battery.remaining position=popup.battery \
                                   icon="Time remaining:" \
                                   icon.width=100 \
                                   icon.align=left \
                                   label="??:??h" \
                                   label.width=100 \
                                   label.align=right \
                                   background.color=0xffffffff
