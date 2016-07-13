#!/bin/bash

song=$(mpc current)

if [ "$song" != "" ];
   then
       echo '<span foreground="#FFFFFF"> '$song' </span>'
fi
