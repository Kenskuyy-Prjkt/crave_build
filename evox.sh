#! /bin/bash

rm -rf .repo/local_manifests
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs
rm -rf prebuilts/clang/host/linux-x86

echo "==> Syncing sources..."
/opt/crave/resync.sh


echo "==> Cleaning old outputs and device/vendor/hardware trees..."
dirs_to_remove=(
    out/target/product/munch
    device/xiaomi/munch
    kernel/xiaomi/munch
    vendor/xiaomi/munch
    vendor/xiaomi/munch-firmware
    vendor/evolution-priv/keys
    hardware/xiaomi
    hardware/dolby
    vendor/xiaomi/miuicamera
    packages/apps/GameBar
)
rm -rf "${dirs_to_remove[@]}"

echo "=== Cloning device trees ==="
git clone https://github.com/Kenskuyy-Prjkt/android_device_xiaomi_munch -b evox device/xiaomi/munch
git clone https://github.com/Kenskuyy-Prjkt/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch
git clone https://github.com/Kenskuyy-Prjkt/fusionX_sm8250 -b wip-next kernel/xiaomi/munch
git clone https://github.com/Kenskuyy-Prjkt/hardware_xiaomi -b bka-no-dolby hardware/xiaomi
git clone https://github.com/kenway214/packages_apps_GameBar.git -b main packages/apps/GameBar
git clone https://github.com/Kenskuyy-Prjkt/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware
git clone https://github.com/Kenskuyy-Prjkt/android_hardware_dolby hardware/dolby
git clone https://github.com/Kenskuyy-Prjkt/android_vendor_xiaomi_miuicamera -b 16 vendor/xiaomi/miuicamera
git clone https://github.com/kenaidi01/private-keys -b main vendor/evolution-priv/keys

echo "=== Starting EvolutionX build ==="
. build/envsetup.sh
lunch lineage_munch-bp2a-user
m evolution

echo "=== All builds completed successfully! ==="

