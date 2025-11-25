#!/bin/sh
PHONEPATH="/modules/kdeconnect/devices/$PHONEID"

if [ "$(pgrep -x "kdeconnectd")" = "" ] ; then
    echo "{ \"text\" : \"\", \"class\" : \"disconnected\"  }"
    exit 1
fi

if [ "$(qdbus org.kde.kdeconnect $PHONEPATH org.kde.kdeconnect.device.isReachable)" = "false" ] ; then
    echo "{ \"text\" : \"\", \"class\" : \"disconnected\"  }"
    exit 1
fi

CHARGE=$(qdbus org.kde.kdeconnect "$PHONEPATH/battery" org.kde.kdeconnect.device.battery.charge)
DEVNAME=$(qdbus org.kde.kdeconnect "$PHONEPATH" org.kde.kdeconnect.device.name)
CHARGING=$(qdbus org.kde.kdeconnect "$PHONEPATH/battery" org.kde.kdeconnect.device.battery.isCharging)

TEXT="Connected to $DEVNAME ($CHARGE% Battery)"
TEXT_CHARGING="Connected to $DEVNAME ($CHARGE% Battery)"

if [ "$CHARGING" = "true" ] ; then
    echo "{ \"text\" : \"$TEXT\", \"class\" : \"charging\"  }"
fi

if [ "$CHARGING" = "false" ] ; then
    echo "{ \"text\" : \"$TEXT\", \"class\" : \"normal\"  }"
fi

