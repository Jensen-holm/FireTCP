#! /bin/bash

FIRE="🔥"
RED='\033[0;31m'
GREEN='\033[0;32m'
RESET='\033[0m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'


suppress_std_out() {
    exec 3>&1
    exec > /dev/null
}

restore_std_out() {
    exec 1>&3
}

print_done() {
    echo -e "✅\n"
}

echo -e "${FIRE}${FIRE}${CYAN}Installing FireApi${RESET}${FIRE}${FIRE}\n"

echo -e -n "${BLUE}cloning the repo${RESET} (https://github.com/Jensen-holm/FireApi) ... "

git clone https://github.com/Jensen-holm/FireApi.git > /dev/null 2>&1

print_done

suppress_std_out

cd FireApi

rm -rf .git .gitignore test

rm -f install.sh *_test.🔥

cd FireApi && mv * ..

cd .. && rm -rf FireApi examples

cd ..

pwd

restore_std_out

echo -e -n "${BLUE}packaging FireApi/ module into FireApi.📦${RESET} ... "

suppress_std_out

mojo package FireApi -o FireApi.📦

restore_std_out
print_done
suppress_std_out

rm -rf FireApi

restore_std_out

echo -e "${FIRE}${FIRE}${GREEN} FireApi Installed Successfull ${RESET}${FIRE}${FIRE}\n"
