#!/bin/bash

# JS Files are copied in role frontend2

if [ $# -ne 1 ] ; then 
    echo "illegal number of parameters"
    echo "add meeting short name"
    exit 1
fi

echo "using $1"

# generate download json
cd /opt/resultdata/base
npm run generate
echo "copy to {{ nginx_frontend_dir }}"
sudo mv {{ rclone_base}}/{{ rclone_folder }}/frontend/downloads.json {{ rclone_base}}/{{ rclone_folder }}/splashdata/$1

cd 

LOG_FILE=rclone_sync.log
BASE_DIR=/opt/s3sync/base/latest
LOG_LEVEL=--log-level=DEBUG

echo $LOG_LEVEL
echo $LOG_FILE

mkdir -p /opt/shared/{{ rclone_folder }}/basedata
cp /opt/frontend2/base/domainfiles/* /opt/shared/{{ rclone_folder }}/basedata
cp /opt/shared/{{ rclone_folder }}/basedata/* /opt/shared/{{ rclone_folder }}

$BASE_DIR/rclone sync --checksum /opt/shared/{{ rclone_folder }} webtiming:webtiming --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE

./run_invalidation.sh
