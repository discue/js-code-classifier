#!/bin/bash

set -ex

../node_modules/.bin/babel raw_training_data --out-dir training/plain --config-file ../.babelrc-plain --delete-dir-on-start --out-file-extension .txt
../node_modules/.bin/babel raw_training_data --out-dir training/plain-es5 --config-file ../.babelrc --delete-dir-on-start --out-file-extension .txt

../node_modules/.bin/babel raw_testing_data --out-dir testing/plain --config-file ../.babelrc-plain --delete-dir-on-start --out-file-extension .txt
../node_modules/.bin/babel raw_testing_data --out-dir testing/plain-es5 --config-file ../.babelrc --delete-dir-on-start --out-file-extension .txtP