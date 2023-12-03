#!/bin/bash

set -ex

declare -r categories=("jjencode" "uglify" "obfuscate" "jsconfuser")

for item in "${categories[@]}"; do
    mkdir -p training/$item
done

for item in "${categories[@]}"; do
    mkdir -p testing/$item
done

time ./fetch_and_copy_training_files.sh
time ./create_plain_js_training_data.sh

node ./encoder.js training
node ./encoder.js testing

set +x
# print file count for training data
count=$(ls training/plain | wc -l)
echo training/plain $count
for item in "${categories[@]}"; do
    count=$(ls training/$item | wc -l)
    echo training/$item $count
done

# print file count for testing data
count=$(ls testing/plain | wc -l)
echo tetestingst/plain $count
for item in "${categories[@]}"; do
    count=$(ls testing/$item | wc -l)
    echo testing/$item $count
done