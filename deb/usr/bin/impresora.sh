#!/bin/bash
if [[ $# -eq 1 ]] && [[ $1 = "-d" ]]
then
	cat /opt/impresora/config
	exit
elif [[ $# -eq 1 ]] && [[ $1 = "-h" ]]
then
	man -l /opt/impresora/readme.1
elif [[ $# -eq 0 ]]
then
	man -l /opt/impresora/readme.1
fi
if [[ $# -eq 2 ]]
then
	if [[ $1 = "-a" ]]
	then
		IFS='-' read -ra var <<< "$2"
		sed -i "1 s/^.*$/${var[0]}-${var[1]}-${var[2]}/g" /opt/impresora/config
	elif [[ $1 = "-b" ]]
	then
		IFS='-' read -ra var <<< "$2"
		sed -i "2 s/^.*$/${var[0]}-${var[1]}/g" /opt/impresora/config
	elif [[ $1 = "-c" ]]
	then
		sed -i "3 s/^.*$/$2/g" /opt/impresora/config
	fi
	exit
fi
