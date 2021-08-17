#!/bin/bash
set -eux

>&2 echo "Hello world"

strict=''
dir=${INPUT_DIR:-$1}

>&2 echo $dir

