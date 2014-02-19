#!/bin/bash
#
# ln -s {$path-to-this-file} /usr/local/bin/bootsb

BOXNAME=sandbox

if [ -z "$1" ]
then
	echo "You must provide start or stop"
	exit 1	
fi

if [ -d ~/zucchi ]
then
    cd ~/zucchi/workspace/$BOXNAME
else
    cd ~/workspace/$BOXNAME
fi

case "$1" in
    'start')
        vagrant up
        vagrant ssh
    ;;

    'stop')
        vagrant halt

    ;;

    'restart')
        vagrant reload
        vagrant ssh
    ;;

    'update')
        vagrant provision
    ;;
esac
