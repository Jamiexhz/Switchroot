#!/bin/sh
sudo apt-get update
sudo apt-get install bc -y
sudo apt-get install bison -y
sudo apt-get install build-essential -y
sudo apt-get install ccache -y
sudo apt-get install curl -y
sudo apt-get install flex -y
sudo apt-get install g++-multilib -y
sudo apt-get install gcc-multilib -y
sudo apt-get install git -y
sudo apt-get install gnupg -y
sudo apt-get install gperf -y
sudo apt-get install imagemagick -y
sudo apt-get install lib32ncurses5-dev -y
sudo apt-get install lib32readline-dev -y
sudo apt-get install lib32z1-dev -y
sudo apt-get install liblz4-tool -y
sudo apt-get install libncurses5 -y
sudo apt-get install libncurses5-dev -y
sudo apt-get install libsdl1.2-dev -y
sudo apt-get install libssl-dev -y
sudo apt-get install libxml2 -y
sudo apt-get install libxml2-utils -y
sudo apt-get install lzop -y
sudo apt-get install pngcrush -y
sudo apt-get install rsync -y
sudo apt-get install schedtool -y
sudo apt-get install squashfs-tools -y
sudo apt-get install xsltproc -y
sudo apt-get install zip -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install repo -y
sudo apt-get install python -y
sudo apt-get install make -y
sudo apt-get install ccache -y
mkdir -p ~/bin
mkdir -p ~/android/lineage
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
git config --global user.email "jamie_xhz@163.com"
git config --global user.name "Jamiexhz"
cd ~/android/lineage
repo init -u -y https://github.com/LineageOS/android.git -b lineage-17.1
repo sync
git clone https://gitlab.com/switchroot/android/manifest.git -b lineage-17.1 .repo/local_manifests
repo sync
source build/envsetup.sh
repopick -t nvidia-enhancements-q
repopick -t nvidia-nvgpu-q
repopick -t icosa-bt-lineage-17.1
repopick 287339
repopick 284553
wget -O .repo/android_device_nvidia_foster.patch https://gitlab.com/ZachyCatGames/q-tips-guide/-/raw/master/res/android_device_nvidia_foster.patch
cd device/nvidia/foster
patch -p1 < ../../../.repo/android_device_nvidia_foster.patch
rm ../../../.repo/android_device_nvidia_foster.patch
cd ../../../bionic
patch -p1 < ../.repo/local_manifests/patches/bionic_intrinsics.patch
cd ../
export USE_CCACHE=1
export CCACHE_EXEC=$(which ccache)
export WITHOUT_CHECK_API=true
ccache -M 50G
lunch lineage_foster_tab-userdebug
sudo make bacon
