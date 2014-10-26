#!/bin/bash

# A simple shell script to show 
# which all computers are turned on
# inside SSL

a="192.168.40."
for i in {11..255}
do
ping -c1 ${a}${i} 2>&1 >/dev/null

if [ "$?" == 0 ]; then
  # zenity --info --title="SpEcHiDe" --text="192.168.40.${i} switched on"
  echo "192.168.40.${i}"
fi
done
