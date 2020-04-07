#!bin/bash

if  [ $1 = "--bash" ] ; then
  HOSTNAME="\h";
  USERNAME="\u";
  TIME="\t";
  WD="\w";
elif [ $1 = "--zsh" ] ; then
  HOSTNAME="%m";
  USERNAME="\u"
else 
  exit 1
fi

if  [ $1 = "--bash" ] ; then
  PS1="\e[0m┌[\e[0;34m$USERNAME\e[0m@\e[0;34m$HOSTNAME\e[0m][\e[0;36m$TIME\e[0m]\n├[\e[0;33m$WD\e[0m][] \n└[]─□\e[0m ";
  echo "u r in bash shell";
elif [ $1 = "--zsh" ] ; then
  echo "u r in zsh shell";
  PROMPT="$HOSTNAME >";
else 
  exit 1
fi

echo "$TIME"