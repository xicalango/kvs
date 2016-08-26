#!/usr/bin/env bash

set -e

KEY="$1"

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

INDEX=$(cat "$KEY/.table")

if [[ $INDEX = "0" ]]; then
  echo "Table is empty"
  exit 1
fi

let INDEX--

CONTENT=$(cat "$KEY/$INDEX")

echo $INDEX > "$KEY/.table"

git add "$KEY/.table"
git rm "$KEY/$INDEX"

git commit -m "removed $INDEX from $KEY"

echo $CONTENT

