#!/bin/bash

sketchybar --query "$NAME" \
  | python3 -c "import sys,json; print(json.load(sys.stdin)['label']['value'], end='')" \
  | pbcopy
