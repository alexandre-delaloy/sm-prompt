#!/bin/bash

local isroot="blue";

if [ "$UID" -eq 0 ] ; then isroot="red" ; fi

local return_code="%(?..%F{red}%? - )%F{default}"

PROMPT='%F{yellow}╭─%F{${isroot}}%n%F{yellow}@%F{cyan}%M $(git_prompt_info) $(git_prompt_status)%F{default} ${dude}
%F{yellow}╰───→ %F{default}'
RPROMPT='${return_code}%F{magenta}%D%F{yellow} /%F{magenta}%t%F{default}'
ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}git:%F{default}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%F{default}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔︎%F{default}"

ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●%F{default} "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}◎%F{default} "
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}○%F{default} "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}‣%F{default} "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta}✖%F{default} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{magenta}✦%F{default} "
