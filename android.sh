#!/bin/sh
sudo apt-get update
sudo apt-get install -y bc 
sudo apt-get install -y bison 
sudo apt-get install -y build-essential 
sudo apt-get install -y ccache 
sudo apt-get install -y curl 
sudo apt-get install -y flex 
sudo apt-get install -y g++-multilib 
sudo apt-get install -y gcc-multilib 
sudo apt-get install -y git 
sudo apt-get install -y gnupg 
sudo apt-get install -y gperf 
sudo apt-get install -y imagemagick 
sudo apt-get install -y lib32ncurses5-dev 
sudo apt-get install -y lib32readline-dev 
sudo apt-get install -y lib32z1-dev 
sudo apt-get install -y liblz4-tool 
sudo apt-get install -y libncurses5 
sudo apt-get install -y libncurses5-dev 
sudo apt-get install -y libsdl1.2-dev 
sudo apt-get install -y libssl-dev 
sudo apt-get install -y libxml2 
sudo apt-get install -y libxml2-utils 
sudo apt-get install -y lzop 
sudo apt-get install -y pngcrush 
sudo apt-get install -y rsync 
sudo apt-get install -y schedtool 
sudo apt-get install -y squashfs-tools 
sudo apt-get install -y xsltproc 
sudo apt-get install -y zip 
sudo apt-get install -y zlib1g-dev
sudo apt-get install -y repo
sudo apt-get install -y python
sudo apt-get install -y make
sudo apt-get install -y ccache
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
