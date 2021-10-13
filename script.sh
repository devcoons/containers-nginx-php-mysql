#!/bin/bash

openssl genrsa 2048 > ca-key.pem
openssl req -new -x509 -nodes -days 3600 -key ca-key.pem -out ca.pem
openssl req -newkey rsa:2048 -days 3600 -nodes -keyout server-key.pem -out server-req.pem
openssl rsa -in server-key.pem -out server-key.pem
openssl x509 -req -in server-req.pem -days 3600 -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out server-cert.pem
openssl req -newkey rsa:2048 -days 3600 -nodes -keyout client-key.pem -out client-req.pem
openssl rsa -in client-key.pem -out client-key.pem
openssl x509 -req -in client-req.pem -days 3600 -CA ca.pem -CAkey ca-key.pem -set_serial 01 -out client-cert.pem
openssl verify -CAfile ca.pem server-cert.pem client-cert.pem
cp ca.pem .apps/web-app/
cp client-key.pem .apps/web-app/
cp client-cert.pem .apps/web-app/
cp ca.pem .configs/web-app-db/
cp ca-key.pem .configs/web-app-db/
cp client-cert.pem .configs/web-app-db/
cp client-key.pem .configs/web-app-db/
cp client-req.pem .configs/web-app-db/
cp server-cert.pem .configs/web-app-db/
cp server-key.pem .configs/web-app-db/
cp server-req.pem .configs/web-app-db/

rm ca.pem ca-key.pem client-cert.pem client-key.pem client-req.pem server-cert.pem server-key.pem server-req.pem


