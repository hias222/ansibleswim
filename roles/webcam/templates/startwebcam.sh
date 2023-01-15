#!/bin/bash

# Kommentar

FILE=/dev/video2

while [ true ]
do
  if [ -e $FILE ] ; then
	echo "start"
	/usr/local/bin/v4l2rtspserver -W 1280 -H 720 -F 30 -P 8554 /dev/video2 -u cam1

    echo "$FILE exists."
  fi

echo wait
sleep 5
done