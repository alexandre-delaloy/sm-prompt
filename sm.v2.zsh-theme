#!bin/zsh

HOSTNAME="%m";
USERNAME="%n";
TIME="%T";
WD="%~";
BLANK="";


# git vars
GIT_BRANCH_NAME="";
GIT_FILES_STATUS="";

GIT_ADDED_FILES=0;
GIT_ADDED_FILES_PROMPT="";

GIT_MODIFIED_FILES=0;
GIT_MODIFIED_FILES_PROMPT="";

GIT_DELETED_FILES=0;
GIT_DELETED_FILES_PROMPT="";

GIT_UNTRACKED_FILES=0;
GIT_UNTRACKED_FILES_PROMPT="";


default() { echo "%F{default}$1%F{default}"; }
red()     { echo "%F{red}$1%F{default}"; } 
green()   { echo "%F{green}$1%F{default}"; } 
yellow()  { echo "%F{yellow}$1%F{default}"; } 
blue()    { echo "%F{blue}$1%F{default}"; } 
magenta() { echo "%F{magenta}$1%F{default}"; } 
cyan()    { echo "%F{cyan}$1%F{default}"; } 

getBranchStatus() {
  git diff --exit-code>/dev/null
  # if there is no diff AND there isn't untracked files
  if [[ $? -eq 0 && GIT_UNTRACKED_FILES -eq 0 ]] ; then
    # then branch is clean
    GIT_BRANCH=$(green $GIT_BRANCH_NAME);
  else
    # else, the branch is dirty
    GIT_BRANCH=$(red $GIT_BRANCH_NAME);
  fi
}

getNumberOfAddedFiles() {
  local MODIFIED_AND_ADDED_FILES=$(git status --porcelain 2>/dev/null| grep "^M" | wc -l);
  local JUST_ADDED_FILES=$(git status --porcelain 2>/dev/null| grep "^A" | wc -l);
  GIT_ADDED_FILES=$(($MODIFIED_AND_ADDED_FILES + $JUST_ADDED_FILES))
  if [ $GIT_ADDED_FILES -ne 0 ] ; then
    GIT_ADDED_FILES_PROMPT=$(green "${GIT_ADDED_FILES//[[:space:]]/$BLANK}+");
  else
    GIT_ADDED_FILES_PROMPT="";
  fi
}

getNumberOfModifiedFiles() {
  local ADDED_THEN_MODIFIED_FILES=$(git status --porcelain 2>/dev/null| grep "^AM" | wc -l);
   local MODIFIED_THEN_ADDED_THEN_MODIFIED_FILES=$(git status --porcelain 2>/dev/null| grep "^MM" | wc -l);
  local JUST_MODIFIED_FILES=$(git status --porcelain 2>/dev/null| grep "^ M" | wc -l);
  GIT_MODIFIED_FILES=$(($ADDED_THEN_MODIFIED_FILES + $JUST_MODIFIED_FILES + $MODIFIED_THEN_ADDED_THEN_MODIFIED_FILES))
  if [ $GIT_MODIFIED_FILES -ne 0 ] ; then
    GIT_MODIFIED_FILES_PROMPT=$(yellow "${GIT_MODIFIED_FILES//[[:space:]]/$BLANK}*");
  else
    GIT_MODIFIED_FILES_PROMPT="";
  fi
}

getNumberOfDeletedFiles() {
  GIT_DELETED_FILES=$(git status --porcelain 2>/dev/null| grep "^ D" | wc -l);
  if [ $GIT_DELETED_FILES -ne 0 ] ; then
    GIT_DELETED_FILES_PROMPT="$(red "${GIT_DELETED_FILES//[[:space:]]/$BLANK}-")";
  else
    GIT_DELETED_FILES_PROMPT="";
  fi
}

getNumberOfUntrackedFiles() {
  GIT_UNTRACKED_FILES=$(git status --porcelain 2>/dev/null| grep "^??" | wc -l);
  if [ $GIT_UNTRACKED_FILES -ne 0 ] ; then
    GIT_UNTRACKED_FILES_PROMPT=$(blue "${GIT_UNTRACKED_FILES//[[:space:]]/$BLANK}?");
  else
    GIT_UNTRACKED_FILES_PROMPT="";
  fi
}

getNumberOfFiles() {
  getNumberOfAddedFiles;
  getNumberOfModifiedFiles;
  getNumberOfDeletedFiles;
  getNumberOfUntrackedFiles;
}

checkIfGitExist() {
  if [ -d ".git" ] ; then

    getNumberOfFiles

    GIT_BRANCH_NAME="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)";

    getBranchStatus;

    GIT="[$(magenta "git"):$GIT_BRANCH]";
    GIT_FILES_STATUS="[$GIT_ADDED_FILES_PROMPT$GIT_MODIFIED_FILES_PROMPT$GIT_DELETED_FILES_PROMPT$GIT_UNTRACKED_FILES_PROMPT]";
  else 
    GIT="";
    GIT_FILES_STATUS="";
  fi
}

promptCommand() {
  checkIfGitExist
  PS1="┌[$(blue $USERNAME)@$(blue $HOSTNAME)][$(cyan $TIME)]
├[$(yellow $WD)]$GIT
└${GIT_FILES_STATUS}─□ ";
}

PROMPT_COMMAND="promptCommand"
precmd() { eval "$PROMPT_COMMAND" }