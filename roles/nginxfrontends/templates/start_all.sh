#!/bin/bash

URL_START=localhost/display

# add script in Startup Applications

function check_ip (){
	echo "Check for IP $1"
	while true 
	do
	   local IP_CHECK_NUMBER=$(ifconfig | grep $1 | wc -l)
	   if [[ "$IP_CHECK_NUMBER" == "1" ]]; then
		 	echo "found it $1"
			break
	   fi
	   sleep 5
	   echo -n .
	done
}

# start in background
# check_ip 169.254

nohup /home/rock/start_flask.sh 2>&1 >> /home/rock/flask.out &
sleep 5
sudo systemctl restart nginx

#echo Start Chromium with $URL_START
#/snap/bin/chromium --kiosk $URL_START &

#while true
#do
#	check_ip 169.254
#	/home/{{ ansible_facts.user_id }}/nuvoled.sh
#done
