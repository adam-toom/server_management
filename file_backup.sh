#!/bin/bash
#script for backing up files
#created 2017-07-26
host=$(echo "$HOSTNAME")
cur=$(date '+%Y-%m-%d')

#makes the directory we're backing up to if it doesn't exist
mkdir -p /backup/$host

#removes backups more than 3 days old
find /backup/$host/ -name ''$host'.*.tar.gz' -type f -mtime +3 -exec rm {} \;

#creates today's backup
tar -czf /backup/$host/$host.$cur.tar.gz /stuff/to/backup

#test of the variables
#echo "$host.$cur.tar.gz"
