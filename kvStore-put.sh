#!/usr/bin/env bash

KEY="$1"
shift

VALUE="$@"

echo "$VALUE" > "$KEY"

git add "$KEY"
git commit -m "put $VALUE in $KEY"

