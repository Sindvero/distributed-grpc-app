#!/bin/sh

domain=$1

mkdir cert
cd cert

# Create key for CA
openssl genrsa -out rootCA.key 2048
# Root certificate
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 1825 -out rootCA.pem

echo "Install this root certificate on your client(s)"

# Create CA-signed certificates for servers
# The key
openssl genrsa -out $domain.key 2048
# CSR (Certificate Signing Request) file
openssl req -new -key $domain.key -out $domain.csr
# Config file to generate the certificate (need it because of SAN)
echo "authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
DNS.1 = $domain" > $domain.ext

# Create Certificate
openssl x509 -req -in $domain.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out $domain.crt -days 825 -sha256 -extfile $domain.ext
