#!/bin/bash

SCRIPTS=$(cd `dirname $0`; pwd)
cd $SCRIPTS/..

rsync -avzP --delete \
  --exclude data \
  --exclude downloads \
  --exclude secrets \
  --exclude node_modules \
  ./services/compose/* \
  root@8.163.10.159:/root/deploy/compose/
