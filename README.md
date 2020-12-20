这是一个Nintendo Switch安卓系统自动编译脚本。  
**使用本脚本及附属教程，可为Nintendo Switch编译并安装最新版本的安卓系统（Android 10，或Android Q）**  
脚本的制作受到了[Gitlab - ZachyCatGames的教程](https://gitlab.com/ZachyCatGames/q-tips-guide) 与 [Lineage OS官方教程](https://wiki.lineageos.org/devices/foster/build) 的指导，感谢原作者。  
教程附录在页面下方。  
  
This is an automatic compile script for Nintendo Switch Android System.  
**By using this script and tutorials attached below, you are able to compile and install Android 10 (or Android Q) on Nintendo Switch.**  
Tutorial is in Chinese Only so far. You may follow [This Guide](https://gitlab.com/ZachyCatGames/q-tips-guide) instead, but replace anything related to commands with this simple one-click script.  
This script won't be possible without the guidance from [Gitlab - ZachyCatGames](https://gitlab.com/ZachyCatGames/q-tips-guide) and [Lineage OS Official](https://wiki.lineageos.org/devices/foster/build).  
  
**使用脚本需自行承担风险，作者不对任何可能造成的问题负责。  
Use this script at your own risk. The author won't be responsible to any problem occurred.**

## 已知问题 Known Issue
  
 + **error: vendor/lineage/build/soong/Android.bp:30:8: module "generated_kernel_includes": cmd: unknown variable '$(PATH_OVERRIDE_SOONG)'**  
   
     + 请在重启系统后尝试执行以下指令  
     Reboot and then try these commands:  
  
       ```
       
       cd ~/android/lineage  
       make clean  
       make bacon
       
       ```
     + 如若未能解决问题，请执行`sudo nano ~/.profile`，删除之前增加的环境变量，即  
     If problem remains, please do `sudo nano ~/.profile` to delete the PATH added previously, which is:  
  
       ```
       
        if [ -d "$HOME/platform-tools" ] ; then  
           PATH=***  
        fi  
        if [ -d "$HOME/bin" ] ; then  
           PATH=*** 
        fi  
        
       ```
     + 手动执行adb环境变量添加命令，即  
     Do these commands manually to add PATHs.
      
      ```
       sudo echo "" >> ~/.profile  
       sudo echo "if [ -d "$HOME/platform-tools" ] ; then" >> ~/.profile  
       sudo echo "    PATH="$HOME/platform-tools:$PATH"" >> ~/.profile  
       sudo echo "fi" >> ~/.profile  
       sudo echo "" >> ~/.profile  
       
      ```  
  
     + 之后，打开脚本文件，自`curl:/storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo`开始，手动执行后续命令  
     Now, open the script file and do the commands manually from `curl:/storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo`  
     + 如问题依然存在，请多次尝试，直至正常编译为止  
     Try more times until the problem was solved.  
  
 + **warning: unused parameter...; warning: missing...**  
   
     + 正常现象。请继续等待编译完成。编译进程可能会长达数个小时。  
     It's normal. Please wait until the compliation progress finishes, which may take several hours.
  
## 使用本脚本 Use this script 
  
 + 执行以下命令:  
   Run commands as below:  
```
wget https://raw.githubusercontent.com/Jamiexhz/Switchroot/main/android.sh
sudo chmod a+x android.sh
sudo ./android.sh
```
 + 建议自行Fork一份到Github仓库，并据实修改git config中的用户名和邮箱。  
   You may fork the script to your own repo and modify the default username & e-mail address in "git config" to yours.  
  
## 安装教程 Installation Tutorials (Chinese) #
  
### 简介  
Switchroot小组已于此前正式发布了安卓8.1（O）系统，您可以从[此处](https://forum.xda-developers.com/nintendo-switch/nintendo-switch-news-guides-discussion--development/rom-switchroot-lineageos-15-1-t3951389)下载安装  
目前，Switchroot正在着手进行安卓10（Q）系统的适配工作。当前系统已处于基本可用状态。  
由于系统bug仍然较多、功能尚不完全、更新频率较高，现需自行编译安装。
在完成环境准备后，执行此脚本，即可便捷编译由Switchroot小组开发的安卓10（Q）系统安装文件。  

### 操作前须知
  
**安卓10（Q）系统添加了以下新特性，如：**  
* 手柄(Joy-Con)有线(滑轨)连接  
* OTG与MTP（连接外置存储设备与电脑）  
* 自动旋转  
* 快速充电及电量显示  
* 深度睡眠（节约电量）等  
  
**优化了以下既有功能：**  
* 系统反应延迟（触摸及界面卡顿）  
* 性能配置  
* 视频输出  
  
**但仍存在部分恶性bug，如：**  
* 深度睡眠（待机）后无法唤醒  
* 使用Chrome浏览器导致的系统崩溃  
* 自动旋转偶发性失灵  
* 游戏渲染问题（偶发性花屏）  
* 蓝牙持续崩溃、蓝牙音频无法使用  
  
**请自行根据需求，选择使用无需编译、相对的稳定的安卓O（8）系统，或依据本教程自行编译安装安卓Q（10）系统**  
**由于本人技术能力有限，无法保证本脚本及附属教程完全适用于您的操作环境，也不能确保由第三方制作的安卓系统不会破坏您的Switch主机。  
对于使用本脚本及相关教程而可能造成的任何不可挽回的损失，作者不承担任何责任。请您三思后行、量力而行。**
  

### 编译、安装与使用教程    

**1. 软件准备**  
  
 + 基本的Linux操作常识  
 + 对Switch Homebrew（自制固件）有一定了解及操作经验
 + 正常的文字理解能力  
  
**2. 硬件准备**  
  
 + Switch端  
   
    >一台可以软破、功能正常的Switch主机  
    >注入器或PC、手机端注入软件  
    >一张32GB以上的空闲内存卡  
    
 + 电脑端  
   
    >16GB以上可用内存；  
    >250GB以上可用硬盘空间；  
    >*（SSD硬盘可以有效提高编译速度）*  
    >原生或虚拟Linux系统；  
    >*（推荐原生安装Ubuntu 20.04以上版本，否则可能会缺少组件导致安装失败）*  
    >高性能CPU  
    >*（将缩短编译时间）*  
  
**3. 执行安装指令**  
  
  ```
  
  wget https://raw.githubusercontent.com/Jamiexhz/Switchroot/main/android.sh
  sudo chmod a+x android.sh
  sudo ./android.sh
  
  ```

**4. 下载安装文件**

所需文件已经打包完毕，待上传
  
**5. 在Switch上完成安装**  
  
待补充
  
 + **Step.1 使用Hetake分区与初始化配置**
       
 + **Step.2 在TWRP内输入镜像**
      
 + **Step.3 刷入GApps（谷歌服务框架）**
      
 + **Step.4 刷入Magisk**
      
