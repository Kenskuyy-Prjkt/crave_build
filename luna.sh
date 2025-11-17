# cleanup
rm -rf .repo/local_manifests/ prebuilts/clang/host/linux-x86

# init repo
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs

# clone local manifests
git clone https://github.com/Kenskuyy-Prjkt/local_manifest.git -b lunaris .repo/local_manifests

# repo sync
[ -f /usr/bin/resync ] && /usr/bin/resync || /opt/crave/resync.sh

# Set up build environment
export BUILD_USERNAME=kenskuyy 
export BUILD_HOSTNAME=nobody 
export TZ="Asia/Jakarta"
source build/envsetup.sh

# Build the ROM
lunch lineage_munch-bp2a-user
# cleanup #3
m lunaris
