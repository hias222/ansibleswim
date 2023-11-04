#!/bin/bash
#{{ nuvoled_base_dir}}/{{ java_dir_version_name }}/bin/java -jar {{ nuvoled_base_dir}}/{{ jar_name }} -h
# 
# debug
# . {{ nuvoledwebsocket_venv }}/bin/activate
# cd {{ nuvoledwebsocket_base_dir }}
# flask --app flaskr run --debug

PID_FILE="/home/{{ ansible_facts.user_id }}/flaskws.pid"

source java_env.sh
source "{{ nuvoledwebsocket_venv }}/bin/activate"

cd "{{ nuvoled_base_dir }}"
ln -s nuvoled.jar nuvoled-1.0-SNAPSHOT-jar-with-dependencies.jar

date > "/home/{{ ansible_facts.user_id }}/flask.out"

if test -f "$PID_FILE"; then
    echo "$PID_FILE exists."
    OLD_PID=$(cat $PID_FILE)
    kill -9 $OLD_PID
    rm $PID_FILE
fi

nohup waitress-serve --call 'flaskr:create_app' >> "/home/{{ ansible_facts.user_id }}/flask.out" 2>&1  &
run_pid=$(echo $!)

echo Process $run_pid started
echo $run_pid > $PID_FILE         