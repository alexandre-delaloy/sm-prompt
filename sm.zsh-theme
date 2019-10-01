#!/bin/bash

# config

# shellcheck disable=SC1091
source ./.config


# write 
#   $(pictos_or_smileys 1 <0/1>) to use emojis
#   $(pictos_or_smileys 0 <0/1>) to use pictos

set_smileys() {
    if [ "$SM_SMILEYS" -eq 1 ] ; then 
        smileys=("[ಠ_ಠ]" "[･‿･]")
    elif [ "$SM_SMILEYS" -eq 0 ] ; then
        smileys=(" ✘" " ✔︎")
    fi
}
set_smileys

corners () {
    local corners=("╭" "├" "╰" "╓" "╟" "╙");
    if [ "$1" -eq 0 ] ; then corners=("╭" "├" "╰");
    elif [ "$1" -eq 1 ] ; then corners=("╓" "╟" "╙") ; fi
    SM_PREFIX="%F{yellow}${corners[1]}─"
    SM_MIDFIX="%F{yellow}${corners[2]}─"
    SM_SUFFIX="%F{yellow}${corners[3]}──→%F{default} "
}

# display red user if sudo is enabeled
sudo_color() {
    if [ "$UID" -eq 0 ] ; then echo "red" ; 
    else echo "blue" ; fi
}


# custom my prompt
return_code="%(?..%F{red}%? - )%F{default}";
SM_USER="%F{$(sudo_color)}%n%F{yellow}@%F{cyan}%m";
SM_DIR="%F{magenta}%~%F{default}";
SM_CLOCK="${return_code}%F{cyan}%D%F{yellow} / %F{blue}%T";

corners "$SM_CORNERS";

sm_prompt() {
    if [ ! "$SM_MULTILINES" -eq 1 ] ; then
        echo '$SM_PREFIX $SM_USER $SM_DIR $(git_prompt_info) $(git_prompt_status)
$SM_SUFFIX' 
    else echo '$SM_PREFIX $SM_USER $(git_prompt_info) $(git_prompt_status)
$SM_MIDFIX $SM_DIR
$SM_SUFFIX' ; fi
}


# set new prompt
PROMPT=$(sm_prompt)
RPROMPT="$SM_CLOCK";

# update vcs values
ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}git:%F{default}";
ZSH_THEME_GIT_PROMPT_SUFFIX="";
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}${smileys[1]}%F{default}";
ZSH_THEME_GIT_PROMPT_CLEAN="%F{red}${smileys[2]}%F{default}";
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●%F{default} ";
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}◎%F{default} ";
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}○%F{default} ";
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}‣%F{default} ";
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{magenta}✦%F{default} ";
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta}✖%F{default} ";