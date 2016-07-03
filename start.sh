#!/bin/bash

until /usr/bin/hciattach /dev/ttyAMA0 bcm43xx 921600 noflow -
do
    echo "Initializing bluetooth failed."
    sleep 5
done
hciconfig hci0 up

while :
do
    hciconf scan
    sleep 5
done
