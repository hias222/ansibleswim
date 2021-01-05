# nginx

## generate certs

Not configured in scripts at the moment

### generate authoritory

```bash
## ca
openssl genrsa -des3 -out myCA.key 2048
# 123456
## root cert
openssl req -x509 -new -nodes -key myCA.key -sha256 -days 1825 -out myCA.pem
```

### import cert to browser/OS

Import it to chrome

### genrate certs

for Certs, to use it in chrome, take name of the router - hostname. A DNS lookup must be possible to avoid errors in Chrome

``bash
#!/bin/sh

if [ "$#" -ne 1 ]
then
  echo "Usage: Must supply a domain"
  exit 1
fi

DOMAIN=$1

cd ~/certs

openssl genrsa -out $DOMAIN.key 2048
openssl req -new -key $DOMAIN.key -out $DOMAIN.csr

cat > $DOMAIN.ext << EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $DOMAIN
EOF

openssl x509 -req -in $DOMAIN.csr -CA ../myCA.pem -CAkey ../myCA.key -CAcreateserial \
-out $DOMAIN.crt -days 825 -sha256 -extfile $DOMAIN.ext
```