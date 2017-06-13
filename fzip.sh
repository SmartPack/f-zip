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
APP1=""
APP2=""
APP3=""
APP4=""
APP5=""
PRIV_APP1=""
PRIV_APP2=""
PRIV_APP3=""
PRIV_APP4=""
PRIV_APP5=""

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

# generating recovery flashable zip file

zip -r9 --exclude=*.sh* --exclude=*.git* --exclude=*README* --exclude=*placeholder* $PROJECT_NAME$PROJECT_VERSION$(date +"%Y%m%d").zip *

# restoring original updater-script...

mv $PROJECT_ROOT/backup.sh META-INF/com/google/android/updater-script

echo -e $COLOR_GREEN"\n everything done\n"$COLOR_NEUTRA
