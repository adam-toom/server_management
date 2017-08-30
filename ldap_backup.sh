#!/bin/bash
#script for backing up the ldap users
#created 2017-08-03
host=$(echo "$HOSTNAME")
cur=$(date '+%Y-%m-%d')

#use slapcat to dump the use data to a file
slapcat -l /tmp/$host.$cur.ldif

#use curl to ftp files to backup machine
curl -T /tmp/$host.$cur.ldif ftp://123.456.789.0
