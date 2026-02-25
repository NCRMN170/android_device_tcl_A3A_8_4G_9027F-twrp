#
# OrangeFox Recovery Project - vendorsetup.sh for Alcatel A3 8.0 4G (A3A_8_4G)
#

FDEVICE="A3A_8_4G"

fox_get_target_device() {
local chkdev=$(echo "$BASH_SOURCE" | grep -w "$FDEVICE")
   if [ -n "$chkdev" ]; then
      FOX_BUILD_DEVICE="$FDEVICE"
   else
      chkdev=$(set | grep BASH_ARGV | grep -w "$FDEVICE")
      [ -n "$chkdev" ] && FOX_BUILD_DEVICE="$FDEVICE"
   fi
}

if [ -z "$1" -a -z "$FOX_BUILD_DEVICE" ]; then
   echo "** WARNING **: Always set FOX_BUILD_DEVICE to the device codename before starting to build!"
   fox_get_target_device
fi

if [ "$1" = "$FDEVICE" -o "$FOX_BUILD_DEVICE" = "$FDEVICE" ]; then

        # --- Temel Derleme Ayarları ---
        export TW_DEFAULT_LANGUAGE="en"
        export LC_ALL="C"
        export ALLOW_MISSING_DEPENDENCIES=true
        export FOX_BUILD_TYPE="Unofficial"
        export OF_MAINTAINER="NCRMN170" 

        # --- Sürüm Bilgileri ---
        export FOX_VERSION="R11.1"
        export FOX_MANIFEST_VER="9.0"
        export FOX_ARCH="arm" 
        export FOX_TARGET_DEVICES="A3A_8_4G,9027F"

        # --- Cihaz Yapısı (Non-SAR & Legacy) ---
        # System-as-root DEĞİL ise bu ayarlar daha stabildir
        export FOX_VIRTUAL_AB_DEVICE="0"
        export OF_DISABLE_MIUI_SPECIFIC_FEATURES="1"
        #export OF_QUICK_BACKUP_LIST="/boot;/data;/system;/vendor;"

        # --- Depolama ve Dosya Sistemleri ---
        export OF_USE_LZ4_COMPRESSION="1"
        export OF_ENABLE_ALL_PARTITION_TOOLS="1"
        export OF_USE_MAGISKBOOT="1"
        export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES="1"
        export OF_PATCH_AVB20="1"

        # --- Ekran Ayarları (8 inç Tablet) ---
        # Çözünürlüğüne göre (Örn: 800x1280) burayı düzenleyebilirsin
        export OF_SCREEN_H=1280
        export OF_ALLOW_DISABLE_NAVBAR="1"
        export OF_USE_DYNAMIC_FULLSCREEN="1"

        # --- Donanım Kısıtlamaları ---
        export OF_FLASHLIGHT_ENABLE="0" # Flaş olmadığı için kapalı
        
        # --- Özellikler ---
        export FOX_DELETE_AROMAFM="1" # Aroma istenmediği için kaldırıldı
        export FOX_USE_SED_BINARY="1"
        export FOX_USE_XZ_UTILS="1"
        export FOX_USE_TAR_BINARY="1"
        export FOX_USE_BASH_SHELL="1"
        export FOX_ASH_IS_BASH="1"
        export FOX_USE_NANO_EDITOR="1"

        # --- Güvenlik ve OTA ---
        export OF_KEEP_DM_VERITY="1"
        export OF_NO_TREBLE_COMPATIBILITY_CHECK="1"
        export OF_DONT_PATCH_ENCRYPTED_DEVICE="1"
        export OF_SKIP_MULTIUSER_FOLDERS_BACKUP="1"
        
        # --- Loglama ---
        if [ -n "$FOX_BUILD_LOG_FILE" -a -f "$FOX_BUILD_LOG_FILE" ]; then
           export | grep "FOX" >> $FOX_BUILD_LOG_FILE
           export | grep "OF_" >> $FOX_BUILD_LOG_FILE
           export | grep "TARGET_" >> $FOX_BUILD_LOG_FILE
           export | grep "TW_" >> $FOX_BUILD_LOG_FILE
        fi
fi

