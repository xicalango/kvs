#!/usr/bin/env bash

set -e

KEY="$1"

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

CUR_INDEX=$(cat "$KEY/.table")

git rm -r "$KEY"

git commit -m "dropped table $KEY"

echo $CUR_SIZE

