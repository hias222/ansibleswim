##!/bin/bash

# JS Files are copied in role frontend2
# {{ rclone_base}}/{{ rclone_folder }}/frontend

# generate download json

LOG_FILE=rclone_vmsync.log
BASE_DIR=/opt/s3sync/base/latest
LOG_LEVEL=--log-level=INFO

#DEBUG is equivalent to -vv. It outputs lots of debug info - useful for bug reports and really finding out what rclone is doing.
#INFO is equivalent to -v. It outputs information about each transfer and prints stats once a minute by default.
#NOTICE is the default log level if no logging flags are supplied. It outputs very little when things are working normally. It outputs warnings and significant events.
#ERROR is equivalent to -q. It only outputs error messages.

echo $LOG_LEVEL 
echo $LOG_FILE

echo `date` >> $LOG_FILE

cd /opt/resultdata/base
npm run generate
echo "copy to {{ nginx_frontend_dir }}"
sudo cp {{ rclone_base}}/{{ rclone_folder }}/frontend/downloads.json {{ nginx_frontend_dir }} 2>&1 >> $LOG_FILE

cd 

$BASE_DIR/rclone sync --checksum /opt/shared/vm sgfuerth:sgfuerth --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE >> $LOG_FILE

./run_invalidation.sh
