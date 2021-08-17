#!/bin/bash

strict=''
dir=${INPUT_DIR:-$1}


if [ -n "${INPUT_STRICT:-}" ]
then
  strict='--strict'
fi

if [ ! -d $dir ]
then
  >&2 echo "Target directory does not exist: $dir"
  exit 1
fi

source ./yaml.sh

for d in $dir/*.yaml 
do
  if [ -f ${d} ]; then
    create_variables $d
    yamale --schema=${d}schema.yaml ${d}data.yaml $strict
  fi
done

