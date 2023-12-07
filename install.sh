#! /bin/bash

FIRE="🔥"
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'

print_done() {
    echo -e "✅\n"
}

echo -e "${FIRE}${FIRE}${CYAN}Installing FireApi${RESET}${FIRE}${FIRE}\n"

echo -e -n "${BLUE}cloning the repo${RESET} (https://github.com/Jensen-holm/FireApi) ... "

git clone https://github.com/Jensen-holm/FireApi.git > /dev/null 2>&1

print_done

cd FireApi

rm -rf .git .gitignore test

rm -f install.sh *_test.🔥

cd FireApi && mv * ..

cd .. && rm -rf FireApi examples

cd ..

pwd

echo -e -n "${BLUE}packaging FireApi/ module into FireApi.📦${RESET} ... "

mojo package FireApi -o FireApi.📦

print_done

rm -rf FireApi

echo -e "${FIRE}${FIRE}${GREEN} FireApi Installed Successfully ${RESET}${FIRE}${FIRE}"

