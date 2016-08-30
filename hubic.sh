#!/bin/sh
# Script to control the hubic client when it is running as another user
# Works in conjunction with an init script you find on GitHub in the same repo
# Latest version: https://github.com/fatso83/hubic-init-script
#
# INSTALL: put it somewhere in your PATH, like /usr/local/bin/

# The user the daemon runs as 
HUBIC_USER=hubic
RUNFILE=/var/run/hubic.run

# read all environment variables from the file created by the init script
if [ ! -e ${RUNFILE} ];then
    echo "HubiC does not seem to be running. There is no file at ${RUNFILE}"
    echo "Are you sure the init script has run yet?"
    echo "See the section called Debugging Errors in the Readme if things go awry"
    exit 1
fi

export $(cat ${RUNFILE})

# run the hubic commands as the hubic user
sudo -E -u $HUBIC_USER hubic $@
