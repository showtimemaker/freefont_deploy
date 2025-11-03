#!/bin/bash

SCRIPTS=$(cd `dirname $0`; pwd)
cd $SCRIPTS

sh ./rsync.sh
ssh root@8.163.10.159 "
  cd /root/deploy/compose/;
  docker compose stop nginx || true;
  docker compose -f docker-compose.letsencrypt.yml up -d  letsencrypt_nginx || true;
  docker compose -f docker-compose.letsencrypt.yml up letsencrypt_renew || true;
  docker compose stop letsencrypt_nginx || true;
  docker compose start nginx || true;
  docker system prune -f;
"
