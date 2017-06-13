#!/bin/bash

#
# Parameters to be set manually...
#

# please-enter-without-space... If left blank, it will display "Flashing" along with project 'PROJECT_VERSION'
PROJECT_NAME=""

# please-enter-without-space... If left blank, it will display "Flashing 'PROJECT_NAME' version"
PROJECT_VERSION=""

# If left blank, it will display "(c)"
COPYRIGHT=""

# Please provide the exact name (should be case sensitive)
APP=""
PRIV_APP=""

#
# Please do not touch unless you know what you are doing... 
#

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[1;32m"
COLOR_NEUTRAL="\033[0m"
PROJECT_ROOT=$PWD

echo -e $COLOR_GREEN"\n F-zip: a command-line flashable zip generator for Linux\n"$COLOR_NEUTRAL
#
echo -e $COLOR_GREEN"\n (c) sunilpaulmathew@xda-developers.com\n"$COLOR_NEUTRAL

# backing up original updater-script...

cp META-INF/com/google/android/updater-script $PROJECT_ROOT/backup.sh

# modifying updater script

DISPLAY_NAME="Flashing $PROJECT_NAME version $PROJECT_VERSION"

sed -i "s;###Flashing###;${DISPLAY_NAME};" META-INF/com/google/android/updater-script;
sed -i "s;###copyright###;(c) ${COPYRIGHT};" META-INF/com/google/android/updater-script;

#  app

if [ -z "$APP" ]; then
	sed -i "s;set_perm_app;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_app;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;main-app;/system/app/${APP};" META-INF/com/google/android/updater-script;
sed -i "s;main-apk;/system/app/${APP}/*;" META-INF/com/google/android/updater-script;

# priv-app

if [ -z "$PRIV_APP" ]; then
	sed -i "s;set_perm_priv;# set_perm;" META-INF/com/google/android/updater-script;		
fi

sed -i "s;set_perm_priv;set_perm;" META-INF/com/google/android/updater-script;
sed -i "s;priv-app;/system/priv-app/${PRIV_APP};" META-INF/com/google/android/updater-script;
sed -i "s;priv-apk;/system/priv-app/${PRIV_APP}/*;" META-INF/com/google/android/updater-script;

# generating recovery flashable zip file

zip -r9 --exclude=*.sh* --exclude=*.git* --exclude=*README* --exclude=*placeholder* $PROJECT_NAME$PROJECT_VERSION$(date +"%Y%m%d").zip *

# restoring original updater-script...

mv $PROJECT_ROOT/backup.sh META-INF/com/google/android/updater-script

echo -e $COLOR_GREEN"\n everything done\n"$COLOR_NEUTRA
