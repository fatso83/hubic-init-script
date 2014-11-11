Overview
--------
This is an init.d script to run the hubiC synchronization client as a service in a non graphic environment.
The service runs as a specific user.

Features
--------
 * start|stop|restart
 * reload : update the sync directory and the exclusions list
 * <parameters from the hubic client> : backup info, etc...

Dependencies
------------
 * [hubiC](https://hubic.com/en/downloads)
 * dbus-launch (package dbus-x11)

Installation
------------
On Debian, run this commands as root:

    git clone https://github.com/leizh/hubic-init-script.git
    . hubic-init-script/build-deb.sh
    dpkg -i hubic-init-script_0.3_all.deb
