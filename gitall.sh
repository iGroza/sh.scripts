#!/bin/bash

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

printf  "${CYAN} > Find git repos in ${NC} "
pwd

find . -name .git -type d -prune | while IFS= read -r d;
do
   if [ -d $d:h ]; then
        printf "${YELLOW} --> ${GREEN} found repo in ${d:h} ${NC}\n"
        printf "execute: ${GREEN}git ${@}${NC}\n"
        cd $d:h
        git $@
        cd $OLDPWD
    fi
done
printf  "${CYAN} > SUCCESS! ${NC}\n"
