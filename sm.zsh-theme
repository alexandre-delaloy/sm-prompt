#!/bin/bash

echo -e "\e[31m
  ╔═════╦══╤══╗
  ║ ────╢  │  ║
  ╟──── ║ │ │ ║ 
  ╚═════╩═╧═╧═╝ theme, a \e[0;1mSimplist\e[0;31m & \e[0;1mMinimalist\e[0;31m theme.
\e[0m"

# write 
#   $(pictos_or_emojis 1 <0/1>) to use emojis
#   $(pictos_or_emojis 0 <0/1>) to use pictos
pictos_or_emojis () {
    local emojis with_emojis;
    local emojis=("✘" "[ಠ_ಠ]" "✔︎" "[･‿･]");
    with_emojis=$1;
    if [ "$2" -eq 0 ] ; then echo "%F{red}${emojis[1 + $with_emojis]}%F{default}" ;
    elif [ "$2" -eq 1 ] ; then echo "%F{green}${emojis[3 + $with_emojis]}%F{default}" ; fi
}

# display red user if sudo is enabeled
sudo_color() {
    if [ "$UID" -eq 0 ] ; then echo "red" ; 
    else echo "blue" ; fi
}

# custom my prompt
local return_code="%(?..%F{red}%? - )%F{default}";
local SM_PREFIX="%F{yellow}╭─";
local SM_MIDFIX="%F{yellow}├─";
local SM_SUFFIX="%F{yellow}╰──→%F{default} ";
local SM_USER="%F{$(sudo_color)}%n%F{yellow}@%F{cyan}%m";
local SM_DIR="%F{magenta}%~%F{default}";
local SM_CLOCK="${return_code}%F{cyan}%D%F{yellow} / %F{blue}%T%F{default}";

# set new prompt
PROMPT='$SM_PREFIX $SM_USER $(git_prompt_info) $(git_prompt_status)
$SM_MIDFIX $SM_DIR
$SM_SUFFIX'
RPROMPT="$SM_CLOCK";

# update vcs values
ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}git:%F{default}";
ZSH_THEME_GIT_PROMPT_SUFFIX="";
ZSH_THEME_GIT_PROMPT_DIRTY=$(pictos_or_emojis 1 0);
ZSH_THEME_GIT_PROMPT_CLEAN=$(pictos_or_emojis 1 1);
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●%F{default} ";
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}◎%F{default} ";
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}○%F{default} ";
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}‣%F{default} ";
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{magenta}✦%F{default} ";
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta}✖%F{default} ";