
R="\e[0;31m[?]\e[0m";
G="\e[0;32m[v]\e[0m";
Y="\e[0;33m[?]\e[0m";

install_theme() {
  local CURRENT_FILE=sm.v2.zsh-theme;
  STATUS="";
  if [ ! -f ~/.sm.zsh-theme ] ; then
    # the file doesn't and will installed
    STATUS="installed"
  else
    # the file exist, has previously been installed, and will be updated
    STATUS="updated"
  fi
  # copy the desired file to the file destination
  cp $CURRENT_FILE ~/.sm.zsh-theme;
}

check_config_file_existence() {
  if [ ! -f ~/.zshrc ] ; then
    echo "$Y .zshrc file was not found."
    touch ~/.zshrc;
    echo "$G .zshrc file has been created."
  else
    echo "$G .zshrc file exist."
  fi
}

source_theme() {
  local STRING="source ~/.sm.zsh-theme"
  if [ $(cat ~/.zshrc | grep $STRING | wc -l) -eq 0 ] ; then
    echo "\n$STRING" >> ~/.zshrc;
    source ~/.zshrc;
    echo "$G Theme sourced.";
  fi
  source ~/.sm.zsh-theme;
}

install_zsh() {
  install_theme
  check_config_file_existence
  source_theme
  
  echo "$G sm-prompt correctly $STATUS.";
}

if [ "$1" = "--zsh" ]; then
  install_zsh
fi