# Ansible to configure RPI

## overall

Deploy software on e.g. raspberry with ansible remote

## decription

<https://github.com/hias222/documentation/blob/main/ansible/Readme.md>

## run

### run update

Example:  
ansible-playbook -i inventories/production/hosts testService.yml --limit=rockpie.fritz.box

### run cleanup

Example:  
ansible-playbook -i inventories/production/hosts testService.yml --limit=rockpi-4b.fritz.box -e global_clean_all=true

## for db

add parameter for mariadb

```bash
character-set-server  = utf8mb4
collation-server      = utf8mb4_general_ci
# a bisserl mehr memory
innodb_buffer_pool_size = 2G
host_cache_size = 1024
thread_cache_size = 1024
# wichtig sonst kommt der meet manager durcheinander
lower_case_table_names = 1
```
