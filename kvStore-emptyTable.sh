#!/usr/bin/env bash

KEY="$1"

mkdir "$KEY"

echo 0 > "$KEY/.table"

git add "$KEY/.table"

git commit -m "new table $KEY"

