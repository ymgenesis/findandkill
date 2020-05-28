#! /bin/bash

exitstat=$?
if [[ $# -eq 0 ]] ; then
	echo 'No process given.'
	echo 'Usage: findandkill [process]'
	echo 'Any processes matching [process] will be killed'
	exit 1
elif [[ $# -eq 1 ]] ; then
	ps aux | grep -v grep | grep -v findandkill.sh | grep --color=auto -i "$1"
	echo
	read -p "The above process(es) will be terminated. Are you sure [y/n]? " -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo "Terminating processes matching "$1"..."
		kill $(ps aux | grep -v grep | grep -v findandkill.sh | grep -i "$1" | awk '{print $2}') > /dev/null 2>&1 || { echo "Failed. Either no running process(es) matching $1, or process(es) $1 belong(s) to root." ; exit 1; }
		echo "Success! All processes matching "$1" were terminated."
	else
		echo "Exiting..."
	fi
else
	echo 'Too many arguments. One at a time.'
	exit 1
fi
