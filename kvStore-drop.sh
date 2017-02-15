#!/usr/bin/env bash

set -e

KEY="$1"
shift

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

VALUE=$(cat "$KEY")

git rm "$KEY"
git commit -m "removed $KEY"

echo $VALUE
