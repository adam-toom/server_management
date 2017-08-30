#!/bin/bash
#script for checking the volume size, and emailing someone if it's too big
#created on 2017-08-29
#
#example line for running this on the cron every hour, assuming that's where you put the script.
#0 * * * * /usr/local/bin/volcheck.sh
#
#editable variables
vol=$(echo "/var")
email=$(echo "email@example.com")
limit=90
#non-editable variables
host=$(echo "$HOSTNAME")
cur=$(df $vol | awk 'FNR == 3 {print $4}' | sed 's/%//g')
used=$(df -h $vol | awk 'FNR == 3 {print $2}')
free=$(df -h $vol | awk 'FNR == 3 {print $3}')

#actually do the thing
if [ "$cur" -gt "$limit" ];
 then
  mail -s 'Disk Space Alert '$host'' $email <<< "Disk space on $host volume $vol is at $cur% with $used used and $free left."
  exit 0
else
 exit 1
fi
