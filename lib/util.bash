#!/bin/bash

# get current time in milliseconds
function currentTime() {
  echo $(($(date +%s%N)/1000000))
}

# load a script and measure time taken
function loadScript() {
  startTime=$(currentTime)

  # execute script
  file=$1
  EXIT_CODE=0
  source $file

  # find out the status code from exit code
  case $EXIT_CODE in
    0) code="DONE";
       color=$Green;
       ;;
    *) code="ERROR";
       color=$Red
  esac

  # print status
  appName=$(cprint "`basename $file | sed 's/.bash$//'`" $BWhite)
  status=$(cprint $code $color)
  timeTaken=$(expr $(currentTime) - $startTime)
  echo -e "....................\r$appName\r\033[20C$status [${timeTaken} msec]"
}

# get current timestamp
timestamp() {
  date +"%s"
}

# backup a file if it exists along with a timestamp
function backupFile() {
  file=$1

  # check if exists and create backup
  if [ -f $file ]; then
    ver=$(timestamp)
    backup="${file}.bak.$ver"
    echo "creating backup $backup"
    mv $file $backup
  fi
}
