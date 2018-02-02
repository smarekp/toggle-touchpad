#!/bin/bash

#========================
#     OUTPUT CONSTS
#========================
RESET="\e[0m"
DIM="\e[2m"
RED="\e[91m"
GRN="\e[32m"
YLW="\e[33m"

#========================
#       VARIABLES
#========================
touchLine=$(synclient | grep "TouchpadOff")
touchInt=$(echo -e "${touchLine: -1}")

#========================
#    TOGGLE TOUCHPAD
#========================
if [ $touchInt -eq 1 ]; then
    synclient TouchpadOff=0
    touchLine=$(synclient | grep "TouchpadOff")
    echo -e "${RESET}${GRN}Touchpad enabled."
    echo -e "${RESET}${DIM}${touchLine}${RESET}"
    exit 0
elif [ $touchInt -eq 0 ]; then
    synclient TouchpadOff=1
    touchLine=$(synclient | grep "TouchpadOff")
    echo -e "${RESET}${RED}Touchpad disabled."
    echo -e "${RESET}${DIM}${touchLine}${RESET}"
    exit 0
else
    echo -e "${RESET}${YLW}Unable to determine touchpad status."
    echo -e "${RESET}${DIM}${touchLine}${RESET}"
    exit 1
fi
