#!/bin/bash
pkgDir="$(dirname ${BASH_SOURCE[0]})"
echo $pkgDir
tmpDir="/tmp/hubic-init-script"
rm -Rf $tmpDir && mkdir $tmpDir
cp -R "$pkgDir/DEBIAN" "$pkgDir/etc" $tmpDir
chmod -R u=rwX,go=rX $tmpDir/*
chmod u=rw,go= $tmpDir/etc/hubic/password
chmod u=rwx,go=rx $tmpDir/DEBIAN/postinst $tmpDir/DEBIAN/postrm
dpkg --build /tmp/hubic-init-script .
rm -Rf $tmpDir
