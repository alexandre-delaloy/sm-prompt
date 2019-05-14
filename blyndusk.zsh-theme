#!/bin/bash

PROMPT='%F{blue}%n%F{yellow}@%F{cyan}%M %F{yellow}→ %F{default}$(git_prompt_info) $(git_prompt_status) '
RPROMPT='%? - %F{magenta}%D%F{yellow}/%F{magenta}%T%F{default}'

ZSH_THEME_GIT_PROMPT_PREFIX="%F{magenta}git:%F{default}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="💩"
ZSH_THEME_GIT_PROMPT_CLEAN="👍"

ZSH_THEME_GIT_PROMPT_ADDED="➕"
ZSH_THEME_GIT_PROMPT_MODIFIED="➖"
ZSH_THEME_GIT_PROMPT_DELETED="✖️"
ZSH_THEME_GIT_PROMPT_RENAMED="⭕️"
ZSH_THEME_GIT_PROMPT_UNMERGED="🚫"
ZSH_THEME_GIT_PROMPT_UNTRACKED="❗️"
