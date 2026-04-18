#!/usr/bin/bash

if test -z $1; then
  echo "Usage: ./delorean.sh [directory]"
  exit 1
fi

if ! test -d $1; then
  echo "Directory not found: $1"
  exit 1
fi

i=0

for path in "$1"/*; do
  timestamp=`date -d "1985-10-26 +$i days" +"%Y%m%d%H%M.%S"`
  touch -t $timestamp $path
  i=$((i + 1))
done

ls -l $1
