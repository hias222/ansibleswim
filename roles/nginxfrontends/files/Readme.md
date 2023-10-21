# copy files

```bash
# as root 
cd /usr/share/nginx/html
rm basic_frontend.tar.gz
tar -cvzf basic_frontend.tar.gz admin/ frontend/ display/ mode/ live/ overlay/ index.html myCA.pem
# copy
scp jetson@jetson:/usr/share/nginx/html/basic_frontend.tar.gz .
scp rock@rockpi-4b:/usr/share/nginx/html/basic_frontend.tar.gz .
scp rock@rockpie:/usr/share/nginx/html/basic_frontend.tar.gz .

# basic file here
~/Nextcloud/trainer/Software/installs
cp basic_frontend.tar.gz ~/Nextcloud/trainer/Software/installs

```

## for nuvoled download java

```bash
wget https://download.java.net/java/GA/jdk19.0.2/fdb695a9d9064ad6b064dc6df578380c/7/GPL/openjdk-19.0.2_linux-aarch64_bin.tar.gz
```
