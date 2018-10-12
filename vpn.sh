#!/bin/bash
echo "Which Server do you want to connect to?"
echo
#Scriptpath variable can be replaced with your own path to the parent directory of your serverlist folder
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ls $SCRIPTPATH/serverlist > list

file='list'
counter=1
while read p
	do
			echo "Number: "$counter "Name: "$p >> tmp
			let counter++
	done < $file
cat tmp

read in
filname=$(cat tmp | grep "Number: $in" | cut -d ' ' -f '4')
rm -rf tmp && rm -rf list
sudo openvpn --config $SCRIPTPATH/serverlist/$filname
