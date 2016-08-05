#!/usr/bin/env bash

set -e

KEY="$1"
shift

VALUE="$@"

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

echo "$VALUE" > "$KEY"

git add "$KEY"
git commit -m "put $VALUE in $KEY"

