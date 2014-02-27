#!/bin/bash
#
# ln -s {$path-to-this-file} /usr/local/bin/bootsb

BOXNAME=sandbox

if [ -z "$1" ]
then
    COMMAND=start
else
    COMMAND=$1
fi

if [ -d ~/zucchi ]
then
    cd ~/zucchi/workspace/$BOXNAME
else
    cd ~/workspace/$BOXNAME
fi

case "$COMMAND" in
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
        git pull origin master
        vagrant provision
    ;;
esac
