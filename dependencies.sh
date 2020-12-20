#!/bin/bash
echo "" | sudo add-apt-repository ppa:nilarimogard/webupd8
sudo apt-get update
sudo apt-get install android-tools-adb -y
sudo apt-get install android-tools-fastboot -y
sudo echo "" >> ~/.profile
sudo echo "if [ -d "$HOME/platform-tools" ] ; then" >> ~/.profile
sudo echo "    PATH="$HOME/platform-tools:$PATH"" >> ~/.profile
sudo echo "fi" >> ~/.profile
sudo echo "" >> ~/.profile
source ~/.profile
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
sleep 30
sudo apt-get install squashfs-tools -y
sudo apt-get install xsltproc -y
sudo apt-get install zip -y
sudo apt-get install zlib1g-dev -y
sudo apt-get install python -y
sudo apt-get install make -y
sudo apt-get install ccache -y
mkdir -p ~/bin
mkdir -p ~/android/lineage
curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
chmod a+x ~/bin/repo
sudo echo "if [ -d "$HOME/bin" ] ; then" >> ~/.profile
sudo echo "    PATH="$HOME/bin:$PATH"" >> ~/.profile
sudo echo "fi" >> ~/.profile
sudo echo "" >> ~/.profile
source ~/.profile
git config --global user.email "jamie_xhz@163.com"
git config --global user.name "Jamiexhz"