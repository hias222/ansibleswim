#!/bin/bash

# JS Files are copied in role frontend2
if [ $# -ne 1 ] ; then 
    echo "illegal number of parameters"
    echo "add meeting short name"
    exit 1
fi

echo "using $1"

BASE_FOLDER=$(pwd)

DEST_FOLDER=/opt/shared/{{ rclone_folder }}

LOG_FILE=$BASE_FOLDER/rclone_get.log
BASE_DIR=/opt/s3sync/base/latest
LOG_LEVEL=--log-level=DEBUG

echo "{{ nginx_frontend_dir }}/splashdata overwrite local nginx data files "

echo LOG_Level: $LOG_LEVEL
echo LOG File $LOG_FILE

mkdir -p ${DEST_FOLDER}

echo Dest Folder: ${DEST_FOLDER}

echo Used: $(du -sh ${DEST_FOLDER})

# echo $BASE_DIR/rclone lsf --checksum webtiming:webtiming --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE
# $BASE_DIR/rclone lsf --checksum webtiming:webtiming --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE

echo $BASE_DIR/rclone copy --checksum webtiming:webtiming ${DEST_FOLDER} --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE
$BASE_DIR/rclone copy --checksum webtiming:webtiming ${DEST_FOLDER} --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE

echo Used: $(du -sh ${DEST_FOLDER})
