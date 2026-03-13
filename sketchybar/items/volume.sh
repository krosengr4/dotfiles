#!/bin/bash

sketchybar --add item volume right \
           --set volume script="$PLUGIN_DIR/volume.sh" \
                        popup.align=center \
           --subscribe volume volume_change mouse.clicked mouse.exited.global \
           --add slider volume.slider popup.volume 250 \
           --set volume.slider \
                               slider.highlight_color=$ACCENT_COLOR \
                               slider.background.height=6 \
                               slider.background.corner_radius=3 \
                               slider.background.color=0xff3a3a3a \
                               background.color=0xffffffff \
                               slider.knob="􀀁" \
                               slider.knob.drawing=on \
                               click_script='osascript -e "set volume output volume $PERCENTAGE"'
