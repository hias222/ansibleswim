#!/bin/bash

# JS Files are copied in role frontend2

# generate download json
cd /opt/resultdata/base
npm run generate
echo "copy to {{ nginx_frontend_dir }}"
sudo cp {{ rclone_base }}/{{ rclone_folder }}/frontend/downloads.json {{ nginx_frontend_dir }}

cd 

echo "{{ nginx_frontend_dir }}/splashdata overwrite local nginx data files "

sudo mkdir -p {{ nginx_frontend_dir }}/../splashdata
# {{ ansible_facts.user_id }}
sudo chown -R {{ ansible_facts.user_id }} {{ nginx_frontend_dir }}/../splashdata
sudo chmod 0775 {{ nginx_frontend_dir }}/../splashdata/
rm -rf {{ nginx_frontend_dir }}/../splashdata/*
cp -r /opt/shared/{{ rclone_folder }}/splashdata/* {{ nginx_frontend_dir }}/../splashdata

