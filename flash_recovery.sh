#!/bin/bash

# Bu script fastboot ile vbmeta img dosyalarını flashlar

echo "VBMeta img dosyaları flashlanıyor..."

adb reboot bootloader

fastboot flash recovery /home/monster/twrp9/out/target/product/A3A_8_4G/recovery.img
fastboot oem reboot-recovery



echo "İşlem tamamlandı. Devam etmek için bir tuşa basın..."
read -n1 -s
