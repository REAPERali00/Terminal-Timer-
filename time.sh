#!/bin/bash

if [ $# -lt 1 ]; then
  echo "No time found. please enter the duration for timer in Minuets "
  exit 1
fi

min=$1

sec=$((min * 60))
while [ $sec -gt 0 ]; do
  echo -ne "Time Left: $(date -u --date @$sec +%H:%M:%S)\r"
  sleep 1
  ((sec--))
done

echo -n "Time is up!!"
mpv ~/Documents/timer/timer.mp3 >/dev/null 2>&1
