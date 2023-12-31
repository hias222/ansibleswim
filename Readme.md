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