#!/bin/bash

# JS Files are copied in role frontend2
# {{ rclone_base}}/{{ rclone_folder }}/frontend

# generate download json

LOG_FILE=rclone_vmsync.log
BASE_DIR=/opt/s3sync/base/latest
LOG_LEVEL=--log-level=INFO

echo $LOG_LEVEL 
echo $LOG_FILE

echo `date` >> $LOG_FILE
cd 
$BASE_DIR/rclone sync --checksum /opt/shared/vm sgfuerth:sgfuerth --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE >> $LOG_FILE
