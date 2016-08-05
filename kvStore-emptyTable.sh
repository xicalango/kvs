#!/usr/bin/env bash

KEY="$1"

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

mkdir "$KEY"

echo 0 > "$KEY/.table"

git add "$KEY/.table"

git commit -m "new table $KEY"

