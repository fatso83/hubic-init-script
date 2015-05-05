Overview
--------
This is an init.d script to run the hubiC synchronization client as a service in a non graphic environment.
The service runs as the `hubic` specific user.

Features
--------
 * start|stop|restart
 * reload : update the sync directory and the exclusions list
 * *parameters from the hubic client* : backup info, etc...

Dependencies
------------
 * [hubiC](https://hubic.com/en/downloads)
 * dbus-launch (package dbus-x11)

Installation
------------
On Debian, run these commands as root:

    git clone https://github.com/leizh/hubic-init-script.git
    . hubic-init-script/build-deb.sh
    dpkg -i hubic-init-script_0.3_all.deb

This will install the script ready to be run at boot-time, but you will need to 
edit the following three files to set various config values:
```
/etc/default/hubic  
/etc/hubic/exclusions  
/etc/hubic/password
```

## Debugging errors
Consider trying out the standalone client before debugging any errors with the init script:
```
dbus-lanch --sh-syntax > dbus.dat
source dbus.dat && rm dbus.dat
hubic --password_path=/etc/hubic/password youruser@domain.com
```
