#!/bin/bash
#script for checking the swap, and emailing someone if it goes over a set limit.
#created on 2017-08-29
#
#editable variables
email=$(echo "email@example.com")
limit=0
#non-editable variables
host=$(echo "$HOSTNAME")
cur=$(free | awk 'FNR == 4 {print $3}')
used=$(free -h | awk 'FNR == 4 {print $3}')
free=$(free -h | awk 'FNR == 4 {print $4}')

#actually do the thing
if [ "$cur" -gt "$limit" ];
 then
  mail -s 'Swap Alert '$host'' $email <<< "Swap on $host is at $used with $free left."
  exit 0
else
 exit 1
fi
