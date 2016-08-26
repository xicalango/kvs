#!/usr/bin/env bash

set -e

KEY="$1"
shift

if [[ -z "$KEY" ]]; then
  echo "no key"
  exit 1
fi

if [[ -f "$KEY/.table" ]]; then
  INDEX=$(cat $KEY/.table)
  
  if [[ $INDEX = 0 ]]; then
    echo "empty table"
    exit 0
  fi
  
  let INDEX--

  BASE_KEY=$(basename "$KEY")

  for i in $(seq 0 $INDEX); do
    echo -n "$BASE_KEY[$i]: "
    cat "$KEY/$i"
  done

else
  cat "$KEY"
fi

