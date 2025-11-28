#!/bin/bash

SCRIPTS=$(cd `dirname $0`; pwd)
cd $SCRIPTS/..

cd services/compose/freefont.showtimemaker.com
git config pull.rebase true
git pull origin main
