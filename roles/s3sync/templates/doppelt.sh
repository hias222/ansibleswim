#!/bin/bash

if [ $# -ne 2 ];
  then
    echo "No arguments supplied"
    echo "usage $0 wknr heatnr"
    exit 0
fi

wettkampf=$1
heat=$2
let nextheat=$heat+1 

MQTT_HOST=localhost
RAW_TOPIC=rawdata

send_raw_message(){
    echo $1
    mosquitto_pub -h $MQTT_HOST -t $RAW_TOPIC -m "$1"
}

while (true)
do 
    send_raw_message "header $wettkampf $heat"
    sleep 10

    send_raw_message "header $wettkampf $nextheat"
    sleep 10
done       