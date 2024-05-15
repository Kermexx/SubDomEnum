#!/bin/bash

echo "Olá! Escreva a URL que você quer enumerar os sub-domínios e os IPs de cada um deles"
echo "Exemplo: google.com"
read resp
wget -q $resp -O index.html
grep -Eo '(http|https)://[^/"]+' index.html | cut -d "/" -f 3 | sort -u > lista
for url in $(cat lista); do host $url | grep "has address" | sort -u
done
