#!/bin/bash

clone_if_missing() {
    local repo="$1"
    local dest="$2"
    local branch="${3:-lineage-24.0}"

    if [ -d "$dest/.git" ]; then
        echo "✓ $dest already exists, skipping."
    else
        echo "→ Cloning $repo into $dest (branch: $branch)"
        mkdir -p "$(dirname "$dest")"
        git clone -b "$branch" "$repo" "$dest"
    fi
}


echo "Cloning hardware repos..."

rm -rf hardware/samsung

clone_if_missing https://github.com/LineageOS/android_hardware_samsung \
    hardware/samsung

# Sync NFC only if repo is initialized and the path is missing
if [ -d ".repo" ] && [ ! -d "hardware/samsung/nfc" ]; then
    repo sync hardware/samsung/nfc
else
    echo "+ hardware/samsung/nfc already present or repo not initialized, skipping repo sync."
fi

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi_libbt \
    hardware/samsung_slsi/libbt

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_config \
    hardware/samsung_slsi-linaro/config

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_exynos \
    hardware/samsung_slsi-linaro/exynos

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_exynos5 \
    hardware/samsung_slsi-linaro/exynos5

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_graphics \
    hardware/samsung_slsi-linaro/graphics

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_interfaces \
    hardware/samsung_slsi-linaro/interfaces

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_openmax \
    hardware/samsung_slsi-linaro/openmax

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_codec2 \
    hardware/samsung_slsi-linaro/codec2

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi-linaro_sgpu \
    hardware/samsung_slsi-linaro/sgpu

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi_scsc_wifibt_wifi_hal \
    hardware/samsung_slsi/scsc_wifibt/wifi_hal

clone_if_missing https://github.com/LineageOS/android_hardware_samsung_slsi_scsc_wifibt_wpa_supplicant_lib \
    hardware/samsung_slsi/scsc_wifibt/wpa_supplicant_lib

echo "Cloning device tree repos..."

clone_if_missing https://github.com/exynos1480/android_device_samsung_a55x \
    device/samsung/a55x

clone_if_missing https://github.com/exynos1480/android_kernel_samsung_a55x \
    kernel/samsung/a55x \
    lineage-23.2

clone_if_missing https://github.com/exynos1480/proprietary_vendor_samsung_a55x \
    vendor/samsung/a55x

clone_if_missing https://github.com/exynos1480/android_device_samsung_slsi_sepolicy \
    device/samsung_slsi/sepolicy

echo ""
echo "+ All repositories processed successfully!"
