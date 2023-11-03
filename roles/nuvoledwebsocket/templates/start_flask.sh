#!/bin/bash
#{{ nuvoled_base_dir}}/{{ java_dir_version_name }}/bin/java -jar {{ nuvoled_base_dir}}/{{ jar_name }} -h
# 
# debug
# . {{ nuvoledwebsocket_venv }}/bin/activate
# cd {{ nuvoledwebsocket_base_dir }}
# flask --app flaskr run --debug

source java_env.sh
source "{{ nuvoledwebsocket_venv }}/bin/activate"

cd {{ nuvoled_base_dir }}
ln -s nuvoled.jar nuvoled-1.0-SNAPSHOT-jar-with-dependencies.jar

waitress-serve --call 'flaskr:create_app'