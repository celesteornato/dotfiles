#!/bin/sh
if ! pgrep -x "kdeconnectd" > /dev/null; then
    exit 1
fi

if qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID org.kde.kdeconnect.device.isReachable | grep true > /dev/null; then
    echo $(qdbus org.kde.kdeconnect /modules/kdeconnect/devices/$PHONEID/battery org.kde.kdeconnect.device.battery.charge)%
fi
