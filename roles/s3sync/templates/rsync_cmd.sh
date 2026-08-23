#!/bin/bash
# rsync -avzP --delete /opt/shared/splash/ pi@pi2:splash/

# REMOTE_SERVER_NAME=pi2.fritz.box
# REMOTE_SERVER_USER=pi
# MY_KEY="~/.ssh/id_rsa"

REMOTE_SERVER_NAME=result.swimdata.de
REMOTE_SERVER_USER=nginx
MY_KEY="~/.aws/ec2-key-pair.pem"

rsync -e "ssh -i $MY_KEY" -avzP --delete --exclude='/frontend' --exclude='/stream' --exclude='/rtmp' /opt/shared/easywk/ ${REMOTE_SERVER_USER}@${REMOTE_SERVER_NAME}:/usr/share/nginx/html