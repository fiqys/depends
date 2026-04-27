#!/bin/bash
set -e

echo "Cleaning old directories..."
rm -rf hardware/samsung

echo "Cloning hardware repos..."

git clone https://github.com/LineageOS/android_hardware_samsung hardware/samsung

repo sync hardware/samsung/nfc

git clone https://github.com/LineageOS/android_hardware_samsung_slsi_libbt hardware/samsung_slsi/libbt
git clone https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_config hardware/samsung_slsi-linaro/config
git clone https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_exynos hardware/samsung_slsi-linaro/exynos
git clone https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_exynos5 hardware/samsung_slsi-linaro/exynos5
git clone https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_graphics hardware/samsung_slsi-linaro/graphics
git clone https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_interfaces hardware/samsung_slsi-linaro/interfaces
git clone https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_openmax hardware/samsung_slsi-linaro/openmax

git clone https://github.com/LineageOS/android_hardware_samsung_slsi_scsc_wifibt_wifi_hal hardware/samsung_slsi/scsc_wifibt/wifi_hal
git clone https://github.com/LineageOS/android_hardware_samsung_slsi_scsc_wifibt_wpa_supplicant_lib hardware/samsung_slsi/scsc_wifibt/wpa_supplicant_lib

echo "Cloning device tree repos..."

git clone https://github.com/exynos1480/android_device_samsung_a55x device/samsung/a55x
git clone https://github.com/exynos1480/android_device_samsung_a55x-common device/samsung/a55x-common
git clone https://github.com/exynos1480/android_kernel_samsung_a55x -b lineage-23.2 kernel/samsung/a55x

git clone https://github.com/exynos1480/proprietary_vendor_samsung_a55x vendor/samsung/a55x
git clone https://github.com/exynos1480/proprietary_vendor_samsung_a55x-common vendor/samsung/a55x-common

git clone https://github.com/exynos1480/android_device_samsung_slsi_sepolicy device/samsung_slsi/sepolicy

echo "All done!"
