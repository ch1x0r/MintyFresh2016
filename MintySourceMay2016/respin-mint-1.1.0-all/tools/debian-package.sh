#!/bin/bash
which dpkg-deb
if [ $? != 0 ]; then
	echo "Error: dpkg-deb is missing!  You need to install dpkg."
	exit 1
fi

DIR="$(pwd)"
PWD="$(cd ${0%/*}/;pwd)"

PACKAGE=$1
VERSION=$2 
DESCRIPTION="Ubuntu and variant system remaster\
 This script creates a livecd of the installed system.\
 You can either make a distributable livecd or backup of your system.\
 For more information, please visit http://www.linuxrespin.org" 
SECTION="Desktop" 
PRIORITY="optional" 
MAINTAINER="$3 <$4>" 
DEPENDS="memtest86+, coreutils, dialog, mkisofs | genisoimage, findutils, bash, passwd, sed, squashfs-tools, casper, rsync, mount, eject, libdebian-installer4, os-prober, ubiquity-frontend-debconf, user-setup, discover1 | discover, laptop-detect, syslinux, util-linux, xresprobe" 
SUGGESTS="respin-gui" 
INSTALLEDSIZE_BYTES=`du --apparent-size -bs $PWD/../build/debian/ | cut -f1`
INSTALLEDSIZE=$(($INSTALLEDSIZE_BYTES/1024))
ARCHITECTURE=$5
HOMEPAGE="http://www.linuxrespin.org/"

mkdir -p $PWD/../build/debian/DEBIAN/
echo "Package: $PACKAGE" > $PWD/../build/debian/DEBIAN/control
echo "Version: $VERSION" >> $PWD/../build/debian/DEBIAN/control
echo "Section: $SECTION" >> $PWD/../build/debian/DEBIAN/control
echo "Priority: $PRIORITY" >> $PWD/../build/debian/DEBIAN/control
echo "Architecture: $ARCHITECTURE" >> $PWD/../build/debian/DEBIAN/control
echo "Depends: $DEPENDS" >> $PWD/../build/debian/DEBIAN/control
echo "Suggests: $SUGGESTS" >> $PWD/../build/debian/DEBIAN/control
echo "Maintainer: $MAINTAINER" >> $PWD/../build/debian/DEBIAN/control
echo "Description: $DESCRIPTION" >> $PWD/../build/debian/DEBIAN/control
echo "Installed-size: $INSTALLEDSIZE" >> $PWD/../build/debian/DEBIAN/control
echo "Homepage: $HOMEPAGE" >> $PWD/../build/debian/DEBIAN/control


sudo chown -R root:root $PWD/../build/debian
sudo chmod -R 755 $PWD/../build/debian
[ -d $PWD/../dist ] || mkdir -p $PWD/../dist
sudo dpkg-deb --build $PWD/../build/debian $PWD/../dist/$PACKAGE\_$VERSION\_$ARCHITECTURE.deb
sudo chown -R $USER:$USER $PWD/../build/debian
cd $DIR

