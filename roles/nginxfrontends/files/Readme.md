# copy files

```bash
# as root 
cd /usr/share/nginx/html
tar -cvzf basic_frontend.tar.gz admin/ frontend/ display/ live/ overlay/
# copy
scp jetson@jetson:/usr/share/nginx/html/basic_frontend.tar.gz .
```
