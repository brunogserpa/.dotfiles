#!/bin/bash

BRIGHTNESS_ACTION=$1
DISPLAY=$2

if [[ -z ${BRIGHTNESS_ACTION} ]]; then
    ddcutil --brief getvcp 0x10 | awk -F' ' '{print $4}'
    exit 0
fi

if [[ ! -z "${DISPLAY}" ]]; then
   COMMAND="ddcutil setvcp 0x10 ${BRIGHTNESS_ACTION} ${BRIGHTNESS_VALUE} --display=${DISPLAY}"
   echo "Running: ${COMMAND}"

   eval "$COMMAND"
   exit 0
fi


# List and change the display brightness
while read DISPLAY_NUM; do
    COMMAND="ddcutil setvcp 0x10 ${BRIGHTNESS_ACTION} ${BRIGHTNESS_VALUE} --display=${DISPLAY_NUM}"
    echo "Running: ${COMMAND}"

    eval "$COMMAND"
    sleep 1
done < <(ddcutil detect | grep Display | awk -F' ' '{print $2}')

wait
ddcutil --brief getvcp 0x10 | awk -F' ' '{print $4}'
