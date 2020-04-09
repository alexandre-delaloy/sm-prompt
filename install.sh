#!/bin/bash

R="\e[0;31m[!]\e[0m";
G="\e[0;32m[v]\e[0m";
Y="\e[0;33m[?]\e[0m";

clear;

FLAG="$1"
RC_FILE=.bashrc;
THEME_LOCATION=~/
ORIGINAL_FILE=sm.bash-theme
THEME_FILE=.sm.bash-theme;
STATUS="installed";

copy_theme() {
  if [ -f $THEME_LOCATION$THEME_FILE ]; then
    STATUS="updated"
  fi

  if [[ $1 = "OMZ" && ! -d $THEME_LOCATION ]] ; then 
    echo "$R $THEME_LOCATION folder not found"
  fi
  
  cp $ORIGINAL_FILE $THEME_LOCATION$THEME_FILE;

  if [ -f $THEME_LOCATION$THEME_FILE ]; then 
    echo "$G Theme file copied to $THEME_LOCATION"; 
  else 
    echo "$R error while copying the theme"; 
  fi
}

check_rc_file_existence() {
  if [ $1 != "OMZ" ]; then
    if [ ! -f ~/$RC_FILE ] ; then
      echo "$Y $RC_FILE file was not found";
      touch ~/$RC_FILE;
      echo "$G $RC_FILE file has been created";
    else
      echo "$G $RC_FILE file exist";
    fi
  fi
}

source_theme() {
  SOURCE="if [ -f $THEME_LOCATION$THEME_FILE ] ; then source $THEME_LOCATION$THEME_FILE ; fi";
  source $THEME_LOCATION$THEME_FILE
  if [ $1 != "OMZ" ]; then
    if [ $(cat ~/$RC_FILE | grep "source $THEME_LOCATION$THEME_FILE" | wc -l) -eq 0 ] ; then
      echo "$SOURCE" >> ~/$RC_FILE;
      source ~/$RC_FILE;
    fi
  else
    source ~/$RC_FILE;
  fi
  echo "$G Theme sourced";
}

install_theme() {
  copy_theme $1;
  check_rc_file_existence $1;
  source_theme $1;
  IS_INSTALLED=false
  if [ -f $THEME_LOCATION$THEME_FILE ]; then 
    if [ $1 = "OMZ" ] ; then
      if [ $(cat ~/$RC_FILE | grep $SOURCE | wc -l) -ne 0 ]; then 
        IS_INSTALLED=true;
      fi
    else
      IS_INSTALLED=true;
    fi
  fi

  if [ $IS_INSTALLED ]; then
    echo "$G sm-prompt correctly $STATUS for $1";
  else 
    echo "$R error while installing the theme"; 
  fi
 
}

confirm() {
  printf "$Y You've choose $1 shell. Continue ? [Y/n] ";
  read -r REPLY;
  
  if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]] ; then
    
    if [ $FLAG = "--zsh" ]; then
      printf "$Y Using OH-MY-ZSH ? [Y/n] ";
      read -r REPLY;
      if [[ $REPLY =~ ^([yY][eE][sS]|[yY])$ ]] ; then
        echo "$G Using Oh-MY-ZSH"
        RC_FILE=.zshrc;
        ORIGINAL_FILE=sm.zsh-theme;
        THEME_FILE=sm.zsh-theme;
        THEME_LOCATION=~/.oh-my-zsh/themes/
        install_theme "OMZ"
        if [ $IS_INSTALLED ]; then
          echo "$Y Make sure to update the \$ZSH_THEME variable in your .zshrc (ZSH_THEME=\"sm\")";
        fi
      else 
        echo "$G Using ZSH"
        RC_FILE=.zshrc;
        ORIGINAL_FILE=sm.zsh-theme;
        THEME_FILE=.sm.zsh-theme;
        install_theme "ZSH";
      fi
    elif [ $FLAG = "--bash" ]; then
      echo "$G Using BASH"
      install_theme "BASH";
    fi
  else
    echo -e "$R Process cancelled"
  fi
}

if [ $FLAG = "--zsh" ]; then
  confirm "ZSH"
elif [ $FLAG = "--bash" ]; then
  confirm "BASH"
fi
