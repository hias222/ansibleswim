#!/bin/bash

# Streaming Service: Custom
# Server: rtmp://your_domain/live
# Play Path/Stream Key: obs_stream
# URL rtmp://your_domain/live/obs_stream

NGINX_CONF_FILE=/etc/nginx/nginx.conf

lead='### BEGINN ADD RTMP SERVER'
tail='### END ADD RTMP SERVER'

sed -i "/^$lead$/,/^$tail$/d" ${NGINX_CONF_FILE}

echo "${lead}" >> ${NGINX_CONF_FILE}

ENTRY=$(echo "
rtmp {
        server {
                listen 1935;
                chunk_size 4096;
                # allow publish 127.0.0.1;
                # deny publish all;

                application obs {
                        live on;
                        record off;
                        hls on;
                        hls_path {{ nginx_html_dir}}/stream/hls;
                        hls_fragment 3;
                        hls_playlist_length 60;

                        dash on;
                        dash_path {{ nginx_html_dir}}/stream/dash;
                        dash_playlist_length 10s;
                        dash_fragment 2s;
                }
        }
}
"
)

echo "$ENTRY" >> ${NGINX_CONF_FILE}
echo "${tail}" >> ${NGINX_CONF_FILE}

#rtmp {
#        server {
#. . .
#                application live {
#                    	live on;
#                    	record off;
#                        hls on;
#                        hls_path /var/www/html/stream/hls;
#                        hls_fragment 3;
#                        hls_playlist_length 60;
#
#                        dash on;
#                        dash_path /var/www/html/stream/dash;
#                }
#        }
#}