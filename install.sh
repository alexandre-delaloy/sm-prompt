#!/bin/bash

local happy_face="\e[32m[･‿･]\e[0m"
local sad_face="\e[31m[ಠ_ಠ]\e[0m"

install_zsh() {
    if [ -d !~/.oh-my-zsh ] ; then echo -e "$sad_face It seems that there is no \e[1;34moh-my-zsh\e[0m folder at the root of this user"
    else 
        cp ./sm.zsh-theme ~/.oh-my-zsh/themes
        if [ -f ~/.oh-my-zsh/themes/sm.zsh-theme ]; then echo -e "$happy_face Congrats! New\e[1;34m zsh theme (sm-theme)\e[0m added !" ; 
        else echo -e "$sad_face Uh oh.. Something went wrong.." ; fi
    fi
}

install_bash() {
    cp ./sm.bash-theme ~
    if ! grep "source ./sm.bash-theme" ~/.bashrc | clear; then printf "\n\nsource ./sm.bash-theme" >> ~/.bashrc ; fi
    if [ -f ~/sm.bash-theme ]; then echo -e "$happy_face Congrats! New\e[1;34m bash theme (sm-theme)\e[0m added !"
    else echo -e "$sad_face Uh oh.. Something went wrong.." ; fi
}

clear

if [[ "$1" = "--zsh" || "$1" = "-z" ]] ; then install_zsh
elif [[ "$1" = "--bash" || "$1" = "-b" ]]  ; then install_bash
elif [[ "$1" = "--all" || "$1" = "-a" || ! "$1" ]]  ; then
    install_zsh
    install_bash
    clear ; echo -e "$happy_face Congrats! All\e[1;34m sm-theme\e[0m added !"
fi