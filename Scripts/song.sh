#!/bin/bash

song=$(mpc current)

echo '<span foreground="#FFFFFF"> '$song' </span>'
