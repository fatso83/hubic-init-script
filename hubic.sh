#!/bin/sh
# Script to control the hubic client when it is running as another user
# Works in conjunction with an init script you find on GitHub in the same repo
# Latest version: https://github.com/fatso83/hubic-init-script
#
# INSTALL: put it somewhere in your PATH, like /usr/local/bin/

# The user the daemon runs as 
HUBIC_USER=hubic

# read all environment variables from the file created by the init script
export $(cat /var/run/hubic.run )

# run the hubic commands as the hubic user
sudo -E -u $HUBIC_USER hubic $@
