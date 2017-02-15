#!/usr/bin/env bash

set -e

KEY="$1"

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

INDEX="$2"

if [[ -z "$INDEX" ]]; then
  echo "no index"
  exit 1
fi

CUR_INDEX=$(cat "$KEY/.table")

if [[ $CUR_INDEX = "0" ]]; then
  echo "Table is empty"
  exit 1
fi

if [[ $INDEX =~ '^[0-9]+$' ]]; then
  echo "not a number: $INDEX"
  exit 1
fi

if [[ $INDEX -lt 0 || $INDEX -ge $CUR_INDEX ]]; then
  echo "invalid index: $INDEX"
  exit 1
fi

let CUR_INDEX--

OLD_CONTENT=$(cat "$KEY/$INDEX")
CONTENT=$(cat "$KEY/$CUR_INDEX")

echo "$CONTENT" > "$KEY/$INDEX"
echo $CUR_INDEX > "$KEY/.table"

git add "$KEY/.table"
git add "$KEY/$INDEX"
git rm "$KEY/$CUR_INDEX"

git commit -m "removed $INDEX from $KEY"

echo $OLD_CONTENT

