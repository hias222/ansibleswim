#!/bin/bash
# rsync -avzP --delete /opt/shared/splash/ pi@pi2:splash/

rsync -avzP --delete --exclude='/frontend' --exclude='/stream' --exclude='/rtmp' /opt/shared/easywk/ pi@pi2:/usr/share/nginx/html