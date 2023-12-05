#! /bin/bash

git clone https://github.com/Jensen-holm/FireApi.git

cd FireApi

rm -rf .git .gitignore

cd FireApi && rm -rf examples

mv * ..
