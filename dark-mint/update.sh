#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo ERROR: You must run this as root
	exit
fi

THEME='dark-mint'
INSTALLDIR=/usr/share/plymouth/themes

printf "Installing '${THEME}' theme..."
update-alternatives --install ${INSTALLDIR}/default.plymouth default.plymouth ${INSTALLDIR}/${THEME}/${THEME}.plymouth 100
printf "... DONE\n"

# printf "Selecting '${THEME}' theme..."
# update-alternatives --set default.plymouth ${INSTALLDIR}/${THEME}/${THEME}.plymouth
# printf ".... DONE\n"

printf "Updating initramfs...\n"
update-initramfs -u
printf "DONE\n"
