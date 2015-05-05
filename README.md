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
# start a shell as the hubic user
sudo su -l -s /bin/bash hubic

# export the DBUS environment variable
export $(cat /run/hubic.run )

# check that the dbus daemon is actually running
hubic status

# if not, start the daemon like this
dbus-lanch --sh-syntax > dbus.dat
source dbus.dat && rm dbus.dat

# you might get "Command failed: System.InvalidOperationException: Already connected." on this. Not dangerous :)
hubic --password_path=/etc/hubic/password $EMAIL "$SYNC_DIR"

# you should be able to get meaningful output at this stage
hubic status
```

## Backing up directories
These directories need to be readable for the `hubic` user! We are also assuming hubic has been 
configured and found working at this point.

```
# Read the DBUS session environment variable
export $(cat /run/hubic.run )

# check existing backups
sudo -u hubic hubic backup info
       Name  Attached  Local path  Last backup      Size
     Bilder        No           -            -  12.87 GB
musikkarkiv        No           -            -       0 B
       priv        No           -            -  15.93 GB

# attach the ones that are accessible on this machine, so that they can continue
sudo -u hubic hubic backup attach Bilder /mnt/data/Bilder
sudo -u hubic hubic backup attach priv /mnt/backup/priv/
sudo -u hubic hubic backup attach musikkarkiv /mnt/data/musikkarkiv/

# create any other backups
hubic backup create  --frequency=weekly /mnt/data/video_archive/
```
