#!/bin/bash

# F-zip: Universal recovery flashable zip generator for Linux & android
# (c) sunilpaulmathew@xda-developers.com
#

#
# Version 1.0.0
#

# This sscript is licensed under the terms of the GNU General Public License version 2, as published by the 
# Free Software Foundation, and may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the 
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#

#
# ################################## Variables to be set manually... ##################################
#

# P1	please-enter-without-space. If left as such, it will display "Flashing" 'PROJECT_VERSION'
PROJECT_NAME=""

# P2	please-enter-without-space. If left as such, it will display "Flashing 'PROJECT_NAME'"
PROJECT_VERSION=""

# Please leave both P1 and P2 as such, if you want to simply display "Flashing" 

# P3	If left as such, it will display "(c)"
COPYRIGHT=""

# P4	Enter y (BOOT="y")if you want to flash a boot.img. Please enter n (BOOT="n") or leave as such (BOOT="") if you do not have a boot.img to flash.
BOOT=""

# P5	Please provide the exact system/app(s) name(s) (should be case sensitive). Please leave as such (APP1="") if you do not have a “folder” to be added to "system/app"
APP1=""
APP2=""
APP3=""
APP4=""
APP5=""

# P6	Please provide the exact system/priv-app(s) name(s) (should be case sensitive). Please leave as such (PRIV_APP1="") if you do not have a “folder” to be added to "system/priv-app"
PRIV_APP1=""
PRIV_APP2=""
PRIV_APP3=""
PRIV_APP4=""
PRIV_APP5=""

# P7	Please enter n (DEV_MSG="n") if you want to hide thanks message by the developer from your recovery zip. Otherwise, please leave as such (DEV_MSG="") or enter y (DEV_MSG="y").
DEV_MSG=""

#
################################## End... ##################################
#

#
# System variables. Please do not touch unless you know what you are doing... 
#

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[1;32m"
COLOR_NEUTRAL="\033[0m"
PROJECT_ROOT=$PWD

echo -e $COLOR_GREEN"\n F-zip: Universal recovery flashable zip generator for Linux & android\n"$COLOR_NEUTRAL
#
echo -e $COLOR_GREEN"\n (c) sunilpaulmathew@xda-developers.com\n"$COLOR_NEUTRAL

# backing up original updater-script...

cp META-INF/com/google/android/updater-script $PROJECT_ROOT/backup.sh

# modifying updater script for boot.img

if [ -z "$BOOT" ]; then
	sed -i "s;ui_print-boot;# ui_print;" META-INF/com/google/android/updater-script;
	sed -i "s;package_extract_file-boot;# package_extract_file;" META-INF/com/google/android/updater-script;
	sed -i "s;run_program-system;# run_program;" META-INF/com/google/android/updater-script;
	sed -i "s;run_program-data;# run_program;" META-INF/com/google/android/updater-script;
	sed -i "s;run_program-cache;# run_program;" META-INF/com/google/android/updater-script;
	sed -i "s;unmount-data;# unmount;" META-INF/com/google/android/updater-script;
	sed -i "s;unmount-system;# unmount;" META-INF/com/google/android/updater-script;
	sed -i "s;run_program-sync;# run_program;" META-INF/com/google/android/updater-script;
	mv -f boot.img $PROJECT_ROOT/boot.sh		
fi

if [ "n" == "$BOOT" ]; then
			sed -i "s;ui_print-boot;# ui_print;" META-INF/com/google/android/updater-script;
			sed -i "s;package_extract_file-boot;# package_extract_file;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-system;# run_program;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-data;# run_program;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-cache;# run_program;" META-INF/com/google/android/updater-script;
			sed -i "s;unmount-data;# unmount;" META-INF/com/google/android/updater-script;
			sed -i "s;unmount-system;# unmount;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-sync;# run_program;" META-INF/com/google/android/updater-script;
			mv -f boot.img $PROJECT_ROOT/boot.sh
		fi

if [ "y" == "$BOOT" ]; then
			sed -i "s;ui_print-boot;ui_print;" META-INF/com/google/android/updater-script;
			sed -i "s;package_extract_file-boot;package_extract_file;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-system;run_program;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-data;run_program;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-cache;run_program;" META-INF/com/google/android/updater-script;
			sed -i "s;unmount-data;unmount;" META-INF/com/google/android/updater-script;
			sed -i "s;unmount-system;unmount;" META-INF/com/google/android/updater-script;
			sed -i "s;run_program-sync;run_program;" META-INF/com/google/android/updater-script;
		fi

# modifying updater script for apps

DISPLAY_NAME="Flashing $PROJECT_NAME $PROJECT_VERSION"

sed -i "s;###Flashing###;${DISPLAY_NAME};" META-INF/com/google/android/updater-script;
sed -i "s;###copyright###;(c) ${COPYRIGHT};" META-INF/com/google/android/updater-script;

#  app1

if [ -z "$APP1" ]; then
	sed -i "s;set_perm_app1;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_app1;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;main-app1;/system/app/${APP1};" META-INF/com/google/android/updater-script;
sed -i "s;main-apk1;/system/app/${APP1}/*;" META-INF/com/google/android/updater-script;

#  app2

if [ -z "$APP2" ]; then
	sed -i "s;set_perm_app2;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_app2;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;main-app2;/system/app/${APP2};" META-INF/com/google/android/updater-script;
sed -i "s;main-apk2;/system/app/${APP2}/*;" META-INF/com/google/android/updater-script;

#  app3

if [ -z "$APP3" ]; then
	sed -i "s;set_perm_app3;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_app3;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;main-app3;/system/app/${APP3};" META-INF/com/google/android/updater-script;
sed -i "s;main-apk3;/system/app/${APP3}/*;" META-INF/com/google/android/updater-script;

#  app4

if [ -z "$APP4" ]; then
	sed -i "s;set_perm_app4;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_app4;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;main-app4;/system/app/${APP4};" META-INF/com/google/android/updater-script;
sed -i "s;main-apk4;/system/app/${APP4}/*;" META-INF/com/google/android/updater-script;

#  app5

if [ -z "$APP5" ]; then
	sed -i "s;set_perm_app5;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_app5;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;main-app5;/system/app/${APP5};" META-INF/com/google/android/updater-script;
sed -i "s;main-apk5;/system/app/${APP5}/*;" META-INF/com/google/android/updater-script;

# priv-app1

if [ -z "$PRIV_APP1" ]; then
	sed -i "s;set_perm_priv1;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_priv1;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;priv-app1;/system/priv-app/${PRIV_APP1};" META-INF/com/google/android/updater-script;
sed -i "s;priv-apk1;/system/priv-app/${PRIV_APP1}/*;" META-INF/com/google/android/updater-script;

# priv-app2

if [ -z "$PRIV_APP2" ]; then
	sed -i "s;set_perm_priv2;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_priv2;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;priv-app2;/system/priv-app/${PRIV_APP2};" META-INF/com/google/android/updater-script;
sed -i "s;priv-apk2;/system/priv-app/${PRIV_APP2}/*;" META-INF/com/google/android/updater-script;

# priv-app3

if [ -z "$PRIV_APP3" ]; then
	sed -i "s;set_perm_priv3;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_priv3;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;priv-app3;/system/priv-app/${PRIV_APP3};" META-INF/com/google/android/updater-script;
sed -i "s;priv-apk3;/system/priv-app/${PRIV_APP3}/*;" META-INF/com/google/android/updater-script;

# priv-app4

if [ -z "$PRIV_APP4" ]; then
	sed -i "s;set_perm_priv4;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_priv4;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;priv-app4;/system/priv-app/${PRIV_APP4};" META-INF/com/google/android/updater-script;
sed -i "s;priv-apk4;/system/priv-app/${PRIV_APP4}/*;" META-INF/com/google/android/updater-script;

# priv-app5

if [ -z "$PRIV_APP5" ]; then
	sed -i "s;set_perm_priv5;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_priv5;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;priv-app5;/system/priv-app/${PRIV_APP5};" META-INF/com/google/android/updater-script;
sed -i "s;priv-apk5;/system/priv-app/${PRIV_APP5}/*;" META-INF/com/google/android/updater-script;

# dev msg

if [ -z "$DEV_MSG" ]; then
	sed -i "s;ui_print-devmsg;ui_print;" META-INF/com/google/android/updater-script;	
fi

if [ "n" == "$DEV_MSG" ]; then
			sed -i "s;ui_print-devmsg;# ui_print;" META-INF/com/google/android/updater-script;
		fi

if [ "y" == "$DEV_MSG" ]; then
			sed -i "s;ui_print-devmsg;ui_print;" META-INF/com/google/android/updater-script;
		fi

# generating recovery flashable zip file

zip -r9 --exclude=*.sh* --exclude=*.git* --exclude=*README* --exclude=*placeholder* $PROJECT_NAME$PROJECT_VERSION$(date +"%Y%m%d").zip *

if [ -z "$BOOT" ]; then	
	mv -f boot.sh $PROJECT_ROOT/boot.img		
fi

if [ "n" == "$BOOT" ]; then			
			mv -f boot.sh $PROJECT_ROOT/boot.img
		fi

# restoring original updater-script...

mv $PROJECT_ROOT/backup.sh META-INF/com/google/android/updater-script

echo -e $COLOR_GREEN"\n everything done\n"$COLOR_NEUTRA
