#!/bin/bash

openssl pkcs12 -export -in /etc/letsencrypt/live/finmosis.com/fullchain.pem -inkey /etc/letsencrypt/live/finmosis.com/privkey.pem -out /usr/local/tomcat/finmosis.com.p12 -password pass:password

keytool -importkeystore -srckeystore /usr/local/tomcat/finmosis.com.p12 -srcstoretype pkcs12 -srcstorepass password -destkeystore /usr/local/tomcat/finmosis.com.keystore -deststoretype jks -deststorepass password

catalina.sh run
