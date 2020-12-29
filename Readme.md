# Ansible to configure RPI

## overall

* used ubuntu 18.04 64 bit
* gpio seems not to work on ubuntu 20.04 64 bit (iomem=relaxed in cmdline.txt doesn't help)

```bash
2020-08-02 13:36:25 initPeripherals: mmap gpio failed (Operation not permitted)
pigpio initialisation failed.
```

## prepare RPI

```bash
ssl-keygen 
# copy pub file to authorized_keys
```

## Install

### normal Install

ansible-playbook site.yml -i inventories/production/hosts --limit vmbox

### overwrite globals

ansible-playbook cassandra.yml -i inventories/production/hosts --limit vmbox -e global_clean_all=true

## Install modules

### webcam

[Webcam](roles/webcam/Readme.md)

### many more

ToDo