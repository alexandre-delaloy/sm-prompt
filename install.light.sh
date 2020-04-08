
R="\e[0;31m[?]\e[0m";
G="\e[0;32m[v]\e[0m";
Y="\e[0;33m[?]\e[0m";

CONFIG_FILE=.zshrc;
THEME_FILE=sm.zsh-theme;

clear;

copy_theme() {
  STATUS="";
  if [ ! -f ~/.$THEME_FILE ] ; then
    # the file doesn't and will installed
    STATUS="installed"
  else
    # the file exist, has previously been installed, and will be updated
    STATUS="updated"
  fi
  # copy the desired file to the file destination
  cp $THEME_FILE ~/.$THEME_FILE;
}

check_rc_file_existence() {
  if [ ! -f ~/$CONFIG_FILE ] ; then
    echo "$Y $CONFIG_FILE file was not found.";
    touch ~/$CONFIG_FILE;
    echo "$G $CONFIG_FILE file has been created.";
  else
    echo "$G $CONFIG_FILE file exist.";
  fi
}

source_theme() {
  local STRING="source ~/.$THEME_FILE"
  if [ $(cat ~/$CONFIG_FILE | grep $STRING | wc -l) -eq 0 ] ; then
    echo "\n$STRING" >> ~/$CONFIG_FILE;
    source ~/$CONFIG_FILE;
    echo "$G Theme sourced.";
  fi
  source ~/.$THEME_FILE;
}

install_theme() {
  copy_theme;
  check_rc_file_existence;
  source_theme;
  local SHELL=${CONFIG_FILE//[.|rc]/""};
  echo "$G sm-prompt correctly $STATUS for $SHELL.";
}

if [ "$1" = "--zsh" ]; then
  CONFIG_FILE="$CONFIG_FILE";
  THEME_FILE="$THEME_FILE";
  echo "$Y You've choose zsh shell"
elif [ "$1" = "--bash" ]; then
  CONFIG_FILE=".bashrc";
  THEME_FILE="sm.bash-theme";
  echo "$Y You've choose bash shell"
fi

install_theme ;