#!/bin/bash

# 0 : nothing
# 1 : username & machine hostname
# 2 : username & machine hostname + git prompt
# 3 : username & machine hostname + current working directory + git prompt

local return_code="%(?..%F{red}%? - )%F{default}"

local issudo="blue";

if [ "$UID" -eq 0 ] ; then issudo="red" ; fi

local prompt_template=(
    '%F{yellow}┌─%F{${issudo}}%n%F{yellow}@%F{cyan}%M $(git_prompt_info) $(git_prompt_status)%F{default}
'
    '%F{yellow}├─ %F{magenta}%~%F{default}
'
    '%F{yellow}└──→%F{default} '
)

for i in "${prompt_template[@]}" ; do final_prompt+="$i" ; done

PROMPT="$final_prompt"
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
