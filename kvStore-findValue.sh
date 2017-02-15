#!/usr/bin/env bash

set -e

VALUE="$1"

if [[ -z "$VALUE" ]]; then
  echo "no value"
  exit 1
fi

FILES=( $(git ls-files | grep -vF '.table') )

set +e
grep -s "${VALUE}" "${FILES[@]}"
RESULT=$?
set -e

if [ $RESULT != 0 ]; then
  echo "no results"
fi

#for FILE in ${FILES[@]}; do
#  if $(grep -sq "${VALUE}" "${FILE}"); then
#    tail -n+1 $FILE
#  fi
#done

