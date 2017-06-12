#!/bin/bash

#
# Parameters to be set manually...
#

PROJECT_NAME=""
PROJECT_VERSION=""
COPYRIGHT=""

APP=""
PRIV_APP=""

#
# Please do not touch unless you know what you are doing... 
#

COLOR_RED="\033[0;31m"
COLOR_GREEN="\033[1;32m"
COLOR_NEUTRAL="\033[0m"
PROJECT_ROOT=$PWD

echo -e $COLOR_GREEN"\n f-zip: commandline flashable zip generator\n"$COLOR_NEUTRAL
#
echo -e $COLOR_GREEN"\n (c) sunilpaulmathew@xda-developers.com\n"$COLOR_NEUTRAL

# backing up modified files

cp META-INF/com/google/android/updater-script $PROJECT_ROOT/backup.sh

# modifying updater script

DISPLAY_NAME="Flashing $PROJECT_NAME $PROJECT_VERSION"
sed -i "s;###Flashing###;${DISPLAY_NAME};" META-INF/com/google/android/updater-script;
sed -i "s;###copyright###;(c) ${COPYRIGHT};" META-INF/com/google/android/updater-script;
sed -i "s;# priv-app;set_perm(1000, 1000, 0755, "/system/priv-app/${PRIV_APP}";" META-INF/com/google/android/updater-script;
sed -i "s;# privapk;set_perm(1000, 1000, 0644, "/system/priv-app/${PRIV_APP}/*";" META-INF/com/google/android/updater-script;

# generating recovery flashable zip file

zip -r9 --exclude=*.sh* --exclude=*.git* --exclude=*README* $PROJECT_NAME.zip *

# restoring original files

mv $PROJECT_ROOT/backup.sh META-INF/com/google/android/updater-script

echo -e $COLOR_GREEN"\n everything done\n"$COLOR_NEUTRA
