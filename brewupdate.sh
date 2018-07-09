#!/bin/sh
notifier=0
if [ ! -x /usr/local/bin/brew ]
then
  echo "[error] Your envrionment don't need this script."
  echo "[error] This script update and upgrade Homebrew"
fi

if [ ! -x /usr/local/bin/terminal-notifier ]
then
  echo "[info] This script notifies at end of system upgrade."
  echo "[info] You use this function, install terminal-notifier command."
  notifier=1
fi

if [ ${notifier} -eq 0 ]
then
  /usr/local/bin/brew update &&
  /usr/local/bin/brew upgrade
else
  /usr/local/bin/brew update &&
  /usr/local/bin/brew upgrade &&
  /usr/local/bin/terminal-notifier -title 'Homebrew Upgrader' -message 'Homebrew is upgraded to latest version!'
fi
