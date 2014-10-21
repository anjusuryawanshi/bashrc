#!/bin/bash

function loadApplication() {
  file=$1
  appName=`basename $file | sed 's/.bash$//'`
  echo -ne "setting up $(cprint $appName $BWhite)...."
  startTime=`date +%s`
  source $file
  timeTaken=$(expr `date +%s` - $startTime)
  echo -e "$(cprint 'done' $Green) [${timeTaken} msec]"
}

export -f loadApplication

# Load all application configurations
find $BASEDIR/app -name "*.bash" -type f | parallel --no-notice "loadApplication {}"