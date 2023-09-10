#!/bin/bash

# JS Files are copied in role frontend2

LOG_FILE=rclone_sync.log
BASE_DIR=/opt/s3sync/base/latest
LOG_LEVEL=--log-level=DEBUG

echo $LOG_LEVEL
echo $LOG_FILE

# cp /opt/shared/{{ rclone_folder }}/basedata/* /opt/shared/{{ rclone_folder }}

$BASE_DIR/rclone sync --checksum /opt/shared/{{ rclone_folder }} webtiming:webtiming --config /opt/s3sync/base/rclone.conf $LOG_LEVEL --log-file=$LOG_FILE

./run_invalidation_one.sh
