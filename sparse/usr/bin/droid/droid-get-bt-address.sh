#!/bin/sh

bt_mac=$(/vendor/bin/hci_qcomm_init -e -p 2 -P 2 -d /dev/ttyHSL0 2>1 | grep -oE '([0-9a-f]{2}:){5}([0-9a-f]{2})')
echo "BT MAC: $bt_mac"
if [ ! -z "$bt_mac" ] ; then
     echo $bt_mac > /var/lib/bluetooth/board-address
     echo "BT MAC: $bt_mac"
fi
