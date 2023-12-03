#!/bin/bash

declare -r path=$1
declare size=$(du -sb "${path}" | awk '{print $1}')

if ((size>100000)); then
  echo "true"
else
  echo "false"
fi