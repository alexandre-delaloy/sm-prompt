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

extractByWildCard() {
  git status --porcelain 2>/dev/null| grep $1 | wc -l
}

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
deleteSpaces() {
  local STRING=$1
  echo ${STRING//[[:space:]]/$BLANK}
}

getNumberOfAddedFiles() {
  local C1=$(extractByWildCard "^[A|AD|AM]");
  local C2=$(extractByWildCard "^MM");
  local FILES=$(($C1 + $C2))
  GIT_ADDED_FILES=$(deleteSpaces $FILES)
  if [ $GIT_ADDED_FILES -ne 0 ] ; then
    GIT_ADDED_FILES_PROMPT=$(green "$GIT_ADDED_FILES+");
  else
    GIT_ADDED_FILES_PROMPT="";
  fi
}

getNumberOfModifiedFiles() {
  local C1=$(extractByWildCard "^\sM");
  local C2=$(extractByWildCard "^AM");
  local C3=$(extractByWildCard "^MM");
  local FILES=$(($C1 + $C2 + $C3))
  GIT_MODIFIED_FILES=${FILES//[[:space:]]/$BLANK};
  if [ $GIT_MODIFIED_FILES -ne 0 ] ; then
    GIT_MODIFIED_FILES_PROMPT=$(yellow "$GIT_MODIFIED_FILES*");
  else
    GIT_MODIFIED_FILES_PROMPT="";
  fi
}

getNumberOfDeletedFiles() {
  local C1=$(extractByWildCard "^\sD");
  local C2=$(extractByWildCard "^AD");
  local FILES=$(($C1 + $C2))
  GIT_DELETED_FILES=${FILES//[[:space:]]/$BLANK};
  if [ $GIT_DELETED_FILES -ne 0 ] ; then
    GIT_DELETED_FILES_PROMPT="$(red "$GIT_DELETED_FILES-")";
  else
    GIT_DELETED_FILES_PROMPT="";
  fi
}

getNumberOfUntrackedFiles() {
  local FILES=$(extractByWildCard "^??");
  GIT_UNTRACKED_FILES=${FILES//[[:space:]]/$BLANK};
  if [ $GIT_UNTRACKED_FILES -ne 0 ] ; then
    GIT_UNTRACKED_FILES_PROMPT=$(blue "$GIT_UNTRACKED_FILES?");
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

    GIT_BRANCH_NAME="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)";

    getNumberOfFiles
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