## How-to-modify fzip.sh?
### Caution
* Do not touch anything else other than listed here unless you know what you are doing.
* If you are using an Android device, you should use a suitable script editor for making necessary modifications on *fzip.sh* (only tested using DroidEdit).
* If you are on windows, use a compatible text editor (e.g. *gedit*, *Notepad++*) to modify *fzip.sh*. Using a non-supported program like *notepad* or *wordpad* likely results the damage of this script.

### 1. PROJECT_NAME="project-name"		
Replace *project-name* with your project name (please-enter-without-space). 

### 2. PROJECT_VERSION="project-version"
Replace *project-version* with your project-version (please-enter-without-space).

### 3. COPYRIGHT="copyright"
Replace *copyright* your copyright text (please-enter-without-space).

### 4. BOOT_PARTITION="/dev/block/platform/msm_sdcc.1/by-name/boot"
Please provide exact path to the boot partition of your device

### 5. APP(1-5)
Please provide the exact system/app(s) name(s) (should be case sensitive). Please leave as such (APP1="") if you do not have a *folder* to be added to *system/app*
APP1=""
APP2=""
APP3=""
APP4=""
APP5=""

### 6. APP=""
Please enter y (APP="y") if you want to add an app(s) directly to */system/app/* (without a separate folder).

### 7. PRIV_APP(1-5)
Please provide the exact system/priv-app(s) name(s) (should be case sensitive). Please leave as such (PRIV_APP1="") if you do not have a *folder* to be added to *system/priv-app*
PRIV_APP1=""
PRIV_APP2=""
PRIV_APP3=""
PRIV_APP4=""
PRIV_APP5=""

### 8. PRIV_APP=""
Please enter y (APP="y") if you want to add an app(s) directly to */system/priv-app/* (without a separate folder).

### 9. LIBRARY=""
Please enter y (LIBRARY="y") if you want to add *.so* file(s) to */system/lib/* (or */system/vendor/lib/* for Android Oreo onwards)

### 10. MODULES=""
Please enter y (MODULES="y") if you want to add *.ko* file(s) to */system/lib/modules/* (or */system/vendor/lib/modules/* for Android Oreo onwards)

### 11. FRAMEWORK=""
Please enter y (FRAMEWORK="y") if you want to add *.jar* file(s) to */system/framework/*

### 12. DEV_MSG=""
Please enter n (DEV_MSG="n") if you want to hide thanks message by the developer from your recovery zip.

### 13. Save and exit.
