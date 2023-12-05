#! /bin/bash

git clone https://github.com/Jensen-holm/FireApi.git

cd FireApi

rm -rf .git .gitignore test

rm -f install.sh *_test.🔥

cd FireApi && mv * ..

cd .. && rm -rf FireApi examples

cd ..

pwd

mojo package FireApi -o FireApi.📦

rm -rf FireApi
