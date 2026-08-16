# install nginx for sync test

## run install

* roles nginx und nginxfrontends
* sudo rm -rf /usr/share/nginx/html/*
* /usr/share/nginx $ sudo chown pi:pi html
* rsync -avzP --delete --exclude='/frontend' --exclude='/stream' --exclude='/rtmp' /opt/shared/easywk/ pi@pi2:/usr/share/nginx/html