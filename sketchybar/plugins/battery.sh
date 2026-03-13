#!/bin/sh

if [ "$SENDER" = "mouse.clicked" ]; then
  REMAINING=$(pmset -g batt | grep -o '[0-9]*:[0-9]* remaining' | head -1 | awk '{print $1}')
  LABEL="${REMAINING:+${REMAINING}h}"
  LABEL="${LABEL:-No estimate}"
  sketchybar --set battery.remaining label="$LABEL" \
             --set battery popup.drawing=toggle
  exit 0
fi

PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

case ${PERCENTAGE} in
  9[0-9]|100) ICON="􀛨"
  ;;
  [6-8][0-9]) ICON="􀺸"
  ;;
  [3-5][0-9]) ICON="􀺶"
  ;;
  [1-2][0-9]) ICON="􀛩"
  ;;
  *) ICON="􀛪"
esac

if [[ $CHARGING != "" ]]; then
  ICON="􀢋"
fi

sketchybar --set $NAME icon="$ICON" label="${PERCENTAGE}%"
