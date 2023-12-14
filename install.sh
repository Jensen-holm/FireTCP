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

echo -e "${FIRE}${FIRE}${CYAN}Installing FireTCP${RESET}${FIRE}${FIRE}\n"

echo -e -n "${BLUE}cloning the repo${RESET} (https://github.com/Jensen-holm/FireTCP) ... "

git clone https://github.com/Jensen-holm/FireTCP.git > /dev/null 2>&1

print_done

cd FireTCP

rm -rf .git .gitignore test examples demo

rm -f install.sh

cd FireTCP && mv * ..

cd .. && rm -rf FireTCP examples

cd ..

pwd

echo -e -n "${BLUE}packaging FireApi/ module into FireTCP.📦${RESET} ... "

mojo package FireTCP -o FireTCP.📦

print_done

rm -rf FireTCP

echo -e "${FIRE}${FIRE}${GREEN} FireTCP Installed Successfully ${RESET}${FIRE}${FIRE}"
