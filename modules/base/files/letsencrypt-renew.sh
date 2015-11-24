#!/bin/bash
export DOMAIN=syss.noip.me
export DIR=/tmp/letsencrypt-auto
export LETSENCRYPT=/mnt/fts300gb/src/letsencrypt

#if Cert older than 30 days and if IP in DNS is current IP
find -L /etc/letsencrypt/live/$DOMAIN/fullchain.pem -mtime +30 | egrep '.*' \
&& if [ `dig +short $DOMAIN | head -1` == `curl canihazip.com/s` ];then
#then renew cert
    mkdir -p $DIR && cd $LETSENCRYPT && ./letsencrypt-auto --renew certonly --server https://acme-v01.api.letsencrypt.org/directory -a webroot --webroot-path=$DIR --agree-dev-preview -d $DOMAIN
#reload apache with new Cert
    service apache2 reload

fi

