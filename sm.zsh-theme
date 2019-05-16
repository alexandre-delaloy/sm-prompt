#!/bin/bash

# 0 : nothing
# 1 : username & machine hostname
# 2 : username & machine hostname + git prompt
# 3 : username & machine hostname + current working directory + git prompt





local RETURN_CODE="%(?..%F{red}%? - )%F{default}";
local ROOT_COLOR="blue";

if [ "$UID" -eq 0 ] ; then ROOT_COLOR="red" ; fi ;

local SM_PREFIX="%F{yellow}╭─";
local SM_MIDFIX="%F{yellow}├─";
local SM_SUFFIX="%F{yellow}╰──→%F{default} ";

local SM_USER="%F{${ROOT_COLOR}}%n%F{yellow}@%F{cyan}%m";
local SM_GIT="$(git_prompt_info) $(git_prompt_status)%F{default}";
local SM_DIR="%F{magenta}%~%F{default}";
local SM_CLOCK="${RETURN_CODE}%F{cyan}%D%F{yellow} / %F{blue}%T%F{default}";

local SM_FINAL_PROMPT="";

local SM_PROMPT_TEMPLATE=(
    '$SM_PREFIX $SM_USER $(git_prompt_info) $(git_prompt_status)%F{default}
'
    '$SM_MIDFIX $SM_DIR
'
    '$SM_SUFFIX'
)

for i in "${SM_PROMPT_TEMPLATE[@]}" ; do SM_FINAL_PROMPT+="$i" ; done ;


PROMPT="$SM_FINAL_PROMPT";
RPROMPT="$SM_CLOCK";

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}git:%F{default}";
ZSH_THEME_GIT_PROMPT_SUFFIX="";
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%F{default}";
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔︎%F{default}";

ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●%F{default} ";
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}◎%F{default} ";
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}○%F{default} ";
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}‣%F{default} ";
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta}✖%F{default} ";
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{magenta}✦%F{default} ";
