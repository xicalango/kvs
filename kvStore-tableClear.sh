#!/usr/bin/env bash

set -e

KEY="$1"

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

CUR_INDEX=$(cat "$KEY/.table")

if [[ $CUR_INDEX = "0" ]]; then
  echo "Table is empty"
  exit 1
fi

SIZE=$CUR_INDEX

let CUR_INDEX--

for i in $(seq 0 $CUR_INDEX); do
  git rm "$KEY/$i"
done

echo 0 > "$KEY/.table"

git add "$KEY/.table"

git commit -m "cleared table $KEY"

echo $SIZE

