#!/bin/bash
# rsync -avzP --delete /opt/shared/splash/ pi@pi2:splash/


# Remote server e.g. in AWS EC2

REMOTE_SERVER_NAME=pi2.fritz.box
# REMOTE_SERVER_NAME=result.swimdata.de


# Reomte user and key

REMOTE_SERVER_USER=pi
MY_KEY="~/.ssh/id_rsa"
# REMOTE_SERVER_USER=nginx
# MY_KEY="~/.aws/ec2-key-pair.pem"


# FOR cps or wasywk

MEETING_SOFTWARE=cps
# MEETING_SOFTWARE=easywk

rsync -e "ssh -i $MY_KEY" -avzP --delete --exclude='/frontend' --exclude='/stream' --exclude='/rtmp' /opt/shared/${MEETING_SOFTWARE}/ ${REMOTE_SERVER_USER}@${REMOTE_SERVER_NAME}:/usr/share/nginx/html