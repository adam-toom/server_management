#!/bin/bash
# script for opening a port on a linux server
# Created: 2017-08-07

iptables () {
sudo iptables -I INPUT -p tcp -m tcp --dport $2 -j ACCEPT
sudo service iptables save
}

firewalld () {
firewall-cmd --add-port=$2/tcp --permanent
firewall-cmd --reload
}

#moving parts
if [ "$(whoami)" != "root" ];
  then
  echo "Please use the sudo command to run this script as root, ie 'sudo ./scriptname.sh'"
  exit 1
elif [ $1 = "iptables" ];
  then
    iptables
	exit 0
elif [ $1 = "firewalld" ];
  then
    firewalld
    exit 0
else
  echo "NAKED RUN: please enter 'iptables' or 'firewalld' depending on what firewall this system uses followed by the port number, ie 'sudo ./uta.sh firewalld 1234'"
  exit 1
fi
