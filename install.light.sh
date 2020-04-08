install_zsh() {
  local CURRENT_FILE=sm.v2.zsh-theme;
  local STATUS="";
  if [ ! -f ~/.sm.zsh-theme ] ; then
    # the file doesn't and will installed
    STATUS="installed"
  else
    # the file exist, has previously been installed, and will be updated
    STATUS="updated"
  fi
  # copy the desired file to the file destination
  cp $CURRENT_FILE ~/.sm.zsh-theme;

  if [ -f ~/.zshrc ] ; then
    source ~/.zshrc;
    source ~/.sm.zsh-theme;
    clear;
    echo "\e[0;32msm-prompt\e[0m correctly $STATUS.";
  else 
    echo "\e[0;33m.zshrc\e[0m file was \e[0;31mnot\e[0m found."

  fi

  local STRING="source ~/.sm.zsh-theme"
  if [ $(cat ~/.zshrc | grep $STRING | wc -l) -eq 0 ] ; then
    echo "Theme \e[0;32msourced\e[0m."
    echo "\n$STRING" >> ~/.zshrc;
  fi
}

if [ "$1" = "--zsh" ]; then
  install_zsh
fi