#!/bin/bash

SCRIPTS=$(cd `dirname $0`; pwd)
cd $SCRIPTS

sh ./git_update.sh
sh ./rsync.sh

cd ../services/compose/freefont.showtimemaker.com
GIT_REVISION=$(git rev-parse HEAD)
cd ../../../

ssh root@8.163.10.159 "
  cd /root/deploy/compose/;
  docker compose build --build-arg GIT_REVISION=$GIT_REVISION freefont_showtimemaker_com || true;
  docker compose stop freefont_showtimemaker_com || true;
  docker compose rm -f freefont_showtimemaker_com || true;
  docker compose up -d freefont_showtimemaker_com || true;
  docker system prune -f;
"

