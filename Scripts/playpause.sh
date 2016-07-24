#!/bin/sh
MPC=/usr/bin/mpc
if [ "$($MPC status | grep pause | cut -d ' ' -f1)" == "[paused]" ]; then 
    $MPC play 1>/dev/null
else
    $MPC pause 1>/dev/null
fi
