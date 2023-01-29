# copy files

```bash
# as root 
cd /usr/share/nginx/html
tar -cvzf basic_frontend.tar.gz admin/ frontend/ display/ live/ overlay/ index.html myCA.pem
# copy
scp jetson@jetson:/usr/share/nginx/html/basic_frontend.tar.gz .
```

## for nuvoled download java

```bash
wget https://download.java.net/java/GA/jdk19.0.2/fdb695a9d9064ad6b064dc6df578380c/7/GPL/openjdk-19.0.2_linux-aarch64_bin.tar.gz
```
