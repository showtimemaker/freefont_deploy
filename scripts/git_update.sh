#!/bin/bash

SCRIPTS=$(cd `dirname $0`; pwd)
cd $SCRIPTS/..

cd services/compose/freefont.showtimemaker.com
git pull origin main
