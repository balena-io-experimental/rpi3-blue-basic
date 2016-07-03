#!/bin/bash

until /usr/bin/hciattach /dev/ttyAMA0 bcm43xx 921600 noflow -
do
    echo "Initializing bluetooth failed."
    sleep 5
done
hciconfig hci0 up

echo "Bluetooth devices:"
hcitool dev

while :
do
    echo "Bluetooth scan"
    hcitool scan
    echo "BLE scan"
    hcitool lescan
    sleep 5
done
