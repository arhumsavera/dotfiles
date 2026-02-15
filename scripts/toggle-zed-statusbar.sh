#!/bin/bash
FILE="$HOME/.config/zed/settings.json"
if grep -q '"experimental.show": false' "$FILE"; then
  sed -i '' 's/"experimental.show": false/"experimental.show": true/' "$FILE"
else
  sed -i '' 's/"experimental.show": true/"experimental.show": false/' "$FILE"
fi
