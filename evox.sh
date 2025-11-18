rm -rf .repo/local_manifests/ prebuilts/clang/host/linux-x86

# init repo
repo init -u https://github.com/Evolution-X/manifest -b bka --git-lfs

# clone local manifests
git clone https://github.com/Kenskuyy-Prjkt/local_manifest.git -b evox .repo/local_manifests

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
m evolution
