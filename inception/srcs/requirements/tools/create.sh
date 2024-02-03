#!/bin/bash
if [ "$1" = "creat" ]; then
if [ ! -d /home/hassimi/data/wp ] && [ ! -d /home/hassimi/data/db ]; then
    mkdir /home/hassimi/data
    chmod 777 /home/hassimi/data
    mkdir /home/hassimi/data/wp
    chmod 777 /home/hassimi/data/wp
    mkdir /home/hassimi/data/db
    chmod 777 /home/hassimi/data/db
fi
fi


if [ "$1" = "delete" ]; then

    rm -rf /home/hassimi/data
fi