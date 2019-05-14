#!/bin/bash

PROMPT='%F{blue}%n%F{yellow}@%F{cyan}%M %F{yellow}→ %F{default}$(git_prompt_info) $(git_prompt_status)'
RPROMPT='%? - %F{magenta}%D%F{yellow}/%F{magenta}%T%F{default}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}git:%F{default}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" %F{red}✘%F{default}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %F{green}✔︎%F{default}"

ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●%F{default} "
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{yellow}◎%F{default} "
ZSH_THEME_GIT_PROMPT_DELETED="%F{red}○%F{default} "
ZSH_THEME_GIT_PROMPT_RENAMED="%F{blue}‣%F{default} "
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{magenta}✖%F{default} "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{magenta}‽%F{default} "
