#!/usr/bin/env bash

KEY="$1"
shift
VALUE="$@"

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

if [[ -z "$VALUE" ]]; then
  echo "no value"
  exit 1
fi

INDEX=$(cat "$KEY/.table")

OLD_INDEX=$INDEX

echo "$VALUE" > "$KEY/$INDEX"


let INDEX++

echo $INDEX > "$KEY/.table"

git add "$KEY/.table"
git add "$KEY/$OLD_INDEX"

git commit -m "added $OLD_INDEX to $KEY"

