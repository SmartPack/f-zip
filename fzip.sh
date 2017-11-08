#!/bin/bash

#
# F-zip: Universal recovery flashable zip generator for Linux & android
# 
# Author: sunilpaulmathew <sunil.kde@gmail.com>
#
# Version 1.0.0
#

# This script is licensed under the terms of the GNU General Public License version 2, as published by the 
# Free Software Foundation, and may be copied, distributed, and modified under those terms.
#
# This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the 
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#

#
# #####	Variables to be set manually...	#####
#

PROJECT_NAME="project-name"		# please-enter-without-space.

PROJECT_VERSION="project-version"	# please-enter-without-space. 
					# If the above two left as such, it will display "Flashing project-name v. project-version"

COPYRIGHT="copyright"			# If left as such, it will display "(c) copyright"

BOOT_PARTITION="/dev/block/platform/msm_sdcc.1/by-name/boot"	# Please provide exact path to the boot partition of your device

# Please provide the exact system/app(s) name(s) (should be case sensitive). Please leave as such (APP1="") if you do not have a “folder” to be added to "system/app"
APP1=""
APP2=""
APP3=""
APP4=""
APP5=""

APP=""			# Please enter y (APP="y") if you want to add an app(s) directly to "/system/app/" (without a separate folder).

# Please provide the exact system/priv-app(s) name(s) (should be case sensitive). Please leave as such (PRIV_APP1="") if you do not have a “folder” to be added to "system/priv-app"
PRIV_APP1=""
PRIV_APP2=""
PRIV_APP3=""
PRIV_APP4=""
PRIV_APP5=""

PRIV_APP=""		# Please enter y (APP="y") if you want to add an app(s) directly to "/system/priv-app/" (without a separate folder).

LIBRARY=""		# Please enter y (LIBRARY="y") if you want to add ".so" file(s) to "/system/lib/"

MODULES=""		# Please enter y (MODULES="y") if you want to add ".ko" file(s) to "/system/lib/modules/"

FRAMEWORK=""		# Please enter y (FRAMEWORK="y") if you want to add ".jar" file(s) to "/system/framework/"

DEV_MSG=""		# Please enter n (DEV_MSG="n") if you want to hide thanks message by the developer from your recovery zip.

#
# #####	The End	#####
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

cp $PROJECT_ROOT/META-INF/com/google/android/updater-script $PROJECT_ROOT/backup.sh

DISPLAY_NAME="Flashing $PROJECT_NAME v. $PROJECT_VERSION"

OUTPUT_FILE="$PROJECT_NAME-v.$PROJECT_VERSION-$(date +"%Y%m%d").zip"

sed -i "s;###Flashing###;${DISPLAY_NAME};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
sed -i "s;###copyright###;(c) ${COPYRIGHT};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;

# dev msg

if [ "n" == "$DEV_MSG" ]; then
	sed -i "s;ui_print-devmsg1;# ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;ui_print-devmsg2;# ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
else
	sed -i "s;ui_print-devmsg1;ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;ui_print-devmsg2;ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

# check and create “.git” folder, if not present, (we sometimes need this folder)...

if [ ! -d "$PROJECT_ROOT/.git/" ]; then
	mkdir $PROJECT_ROOT/.git/
fi

# modifying updater script...

# system-app(s)

if [ "y" == "$APP" ]; then
	sed -i "s;# set_perm_sysapp;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
else
	if [ -z "$(ls -A system/app/ --ignore=placeholder)" ]; then
		# hiding “app” folder since it is empty
		mv $PROJECT_ROOT/system/app/ $PROJECT_ROOT/.git/
	fi
fi

if [ -z "$APP1" ]; then
	sed -i "s;set_perm_app1;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_app1;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-app1;/system/app/${APP1};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-apk1;/system/app/${APP1}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$APP2" ]; then
	sed -i "s;set_perm_app2;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_app2;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-app2;/system/app/${APP2};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-apk2;/system/app/${APP2}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$APP3" ]; then
	sed -i "s;set_perm_app3;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_app3;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-app3;/system/app/${APP3};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-apk3;/system/app/${APP3}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$APP4" ]; then
	sed -i "s;set_perm_app4;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_app4;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-app4;/system/app/${APP4};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-apk4;/system/app/${APP4}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$APP5" ]; then
	sed -i "s;set_perm_app5;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_app5;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-app5;/system/app/${APP5};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;main-apk5;/system/app/${APP5}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

# priv-app(s)

if [ "y" == "$PRIV_APP" ]; then
	sed -i "s;# set_perm_privapp;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
else
	if [ -z "$(ls -A system/priv-app/ --ignore=placeholder)" ]; then
		# hiding “priv-app” folder since it is empty
		mv $PROJECT_ROOT/system/priv-app/ $PROJECT_ROOT/.git/
	fi
fi

if [ -z "$PRIV_APP1" ]; then
	sed -i "s;set_perm_priv1;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_priv1;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-app1;/system/priv-app/${PRIV_APP1};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-apk1;/system/priv-app/${PRIV_APP1}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$PRIV_APP2" ]; then
	sed -i "s;set_perm_priv2;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_priv2;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-app2;/system/priv-app/${PRIV_APP2};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-apk2;/system/priv-app/${PRIV_APP2}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$PRIV_APP3" ]; then
	sed -i "s;set_perm_priv3;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_priv3;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-app3;/system/priv-app/${PRIV_APP3};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-apk3;/system/priv-app/${PRIV_APP3}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$PRIV_APP4" ]; then
	sed -i "s;set_perm_priv4;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_priv4;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-app4;/system/priv-app/${PRIV_APP4};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-apk4;/system/priv-app/${PRIV_APP4}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

if [ -z "$PRIV_APP5" ]; then
	sed -i "s;set_perm_priv5;# set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;		
else
	sed -i "s;set_perm_priv5;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-app5;/system/priv-app/${PRIV_APP5};" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;priv-apk5;/system/priv-app/${PRIV_APP5}/*;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

# framework

if [ "y" == "$FRAMEWORK" ]; then
	sed -i "s;# set_perm_jar;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
else
	if [ -z "$(ls -A system/framework/ --ignore=placeholder)" ]; then
		# hiding “framework” folder since it is empty
		mv $PROJECT_ROOT/system/framework/ $PROJECT_ROOT/.git/
	fi
fi

if [ -e system/framework/framework-res.apk ]; then
	sed -i "s;# set_perm-fwr;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

# lib & modules
if [ "y" == "$LIBRARY" ]; then
	sed -i "s;# set_perm_lib;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	if [ "y" == "$MODULES" ]; then
		sed -i "s;# set_perm_modules;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	else
		if [ -z "$(ls -A system/lib/modules/ --ignore=placeholder)" ]; then
			# hiding "modules" folder since it is empty
			mv $PROJECT_ROOT/system/lib/modules $PROJECT_ROOT/.git/
		fi
	fi
else
	if [ "y" == "$MODULES" ]; then
		sed -i "s;# set_perm_modules;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	else
		if [ -z "$(ls -A system/lib/ --ignore=placeholder --ignore=modules)" ]; then
			# hiding “lib” & "modules" directories since they are empty
			mv $PROJECT_ROOT/system/lib/ $PROJECT_ROOT/.git/
		fi
	fi
fi

# bootanimation

if [ -e system/media/bootanimation.zip ]; then
	sed -i "s;# set_perm-bootanimation;set_perm;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
else
	# hiding “media” folder since it is empty
	mv $PROJECT_ROOT/system/media/ $PROJECT_ROOT/.git/
fi

# boot.img

if [ -e boot.img ]; then
	if [ -z "$BOOT_PARTITION" ]; then
		mv $PROJECT_ROOT/boot.img $PROJECT_ROOT/boot.sh
		echo -e $COLOR_GREEN"\n Error found. Please check line# 30\n"$COLOR_NEUTRAL
		echo -e $COLOR_GREEN"\n 'boot.img' is excluded from the $OUTPUT_FILE \n"$COLOR_NEUTRAL
	else
		sed -i "s;boot-partition;$BOOT_PARTITION;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# ui_print-boot;ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# package_extract_file-boot;package_extract_file;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# run_program-system;run_program;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# run_program-data;run_program;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# run_program-cache;run_program;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# unmount-data;unmount;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# unmount-system;unmount;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
		sed -i "s;# run_program-sync;run_program;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	fi
fi

# dev msg

if [ "n" == "$DEV_MSG" ]; then
	sed -i "s;ui_print-devmsg1;# ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;ui_print-devmsg2;# ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
else
	sed -i "s;ui_print-devmsg1;ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
	sed -i "s;ui_print-devmsg2;ui_print;" $PROJECT_ROOT/META-INF/com/google/android/updater-script;
fi

# hiding the remaining unused folder(s), if any

if [ -z "$(ls -A $PROJECT_ROOT/system/)" ]; then
	rm -r $PROJECT_ROOT/system/
fi

# generating recovery flashable zip file

zip -r9 --exclude=*.sh* --exclude=*.git* --exclude=*.md* --exclude=*placeholder* $OUTPUT_FILE *

# restoring original updater-script...

if [ -z "$BOOT_PARTITION" ]; then
		mv $PROJECT_ROOT/boot.sh $PROJECT_ROOT/boot.img
fi

mv $PROJECT_ROOT/backup.sh $PROJECT_ROOT/META-INF/com/google/android/updater-script

if [ ! -d "$PROJECT_ROOT/system" ]; then
	mkdir $PROJECT_ROOT/system/
fi

if [ -e $PROJECT_ROOT/.git/media/ ]; then
	mv $PROJECT_ROOT/.git/media/ $PROJECT_ROOT/system/
fi

if [ -e .git/lib/ ]; then
	mv $PROJECT_ROOT/.git/lib/ $PROJECT_ROOT/system/
fi

if [ -e .git/modules/ ]; then
	mv $PROJECT_ROOT/.git/modules $PROJECT_ROOT/system/lib/
fi

if [ -e .git/framework/ ]; then
	mv $PROJECT_ROOT/.git/framework/ $PROJECT_ROOT/system/
fi

if [ -e .git/app/ ]; then
	mv $PROJECT_ROOT/.git/app/ $PROJECT_ROOT/system/
fi

if [ -e .git/priv-app/ ]; then
	mv $PROJECT_ROOT/.git/priv-app/ $PROJECT_ROOT/system/
fi

echo -e $COLOR_GREEN"\n everything done... $OUTPUT_FILE is generated in the root folder...\n"$COLOR_NEUTRAL
