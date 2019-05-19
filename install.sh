#!/bin/bash

install() {
    if [ -d !~/.oh-my-zsh ] ; then echo -e "\e[31m[ಠ_ಠ]\e[0m It seems that there is no \e[1;34moh-my-zsh\e[0m folder at the root of this user"
    else 

        cp ./sm.zsh-theme ~/.oh-my-zsh/themes
        if [ -f ~/.oh-my-zsh/themes/sm.zsh-theme ]; then echo -e "\e[32m[･‿･]\e[0m Congrats! New\e[1;34m zsh theme (sm-theme)\e[0m added !" ; fi
    fi
}

install