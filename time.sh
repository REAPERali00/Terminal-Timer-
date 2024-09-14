#!/bin/bash

if [ $# -lt 1 ]; then
  echo "No time found. please enter the duration for timer in Minuets "
  exit 1
fi

checkInstall() {
  command -v "$1" >/dev/null 2>&1
}
min=$1

sec=$((min * 60))
while [ $sec -gt 0 ]; do
  clear
  if checkInstall cowsay; then
    echo -ne "Time Left: $(date -u --date @$sec +%H:%M:%S)\r" | cowsay
  else
    echo -ne "Time Left: $(date -u --date @$sec +%H:%M:%S)\r"
  fi
  sleep 1
  ((sec--))
done

echo -n "Time is up!!"
mpv ~/Documents/timer/timer.mp3 >/dev/null 2>&1
