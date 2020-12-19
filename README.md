这是一个Nintendo Switch 安卓系统自动编译脚本。  
**使用本脚本及附属教程，可为Nintendo Switch安装最新版本的安卓系统（Android 10，或Android Q）**  
  
This is an automatic compile script for Android System on Nintendo Switch.  
**By using this script and tutorials attached below (Chinese Only so far), you are able to compile and install Android 10 (or Android Q) on Nintendo Switch.**  


## 使用本脚本 Use the script： 
  
建议自行Fork一份到Github仓库，并据实修改git config中的用户名和邮箱。  
You may fork the script to your own repo and modify the default username & e-mail address in "git config" to yours.
```
wget https://raw.githubusercontent.com/Jamiexhz/Switchroot/main/android.sh
sudo chmod a+x android.sh
sudo ./android.sh
```
  
## 安装教程 Tutorials (Chinese) #
  
### 简介  
Switchroot小组已于此前正式发布了安卓8.1（O）系统，您可以从[此处](https://forum.xda-developers.com/nintendo-switch/nintendo-switch-news-guides-discussion--development/rom-switchroot-lineageos-15-1-t3951389)下载安装  
目前，Switchroot正在着手进行安卓10（Q）系统的适配工作。当前系统已处于基本可用状态。  
由于系统bug仍然较多、功能尚不完全、更新频率较高，现需自行编译安装。
在完成前置操作后，执行此脚本，即可便捷编译由Switchroot小组开发的安卓10（Q）系统安装文件。  

### 操作前须知
  
**安卓10（Q）系统添加了以下新特性，如：**  
* 手柄有线连接  
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
  
    >基本的Linux操作常识  
    >对Switch Homebrew（自制固件）有一定了解及操作经验
    >常人的文字理解能力  
  
**2. 硬件准备**  
  
 + Switch端  
    >一台可以软破、功能正常的Switch主机  
    >注入器或PC、手机端注入软件  
    >一张32GB以上的空闲内存卡  
 + 电脑端  
    >16GB以上可用内存；  
    >250GB以上可用硬盘空间；  
    >（SSD硬盘可以有效提高编译速度）  
    >原生或虚拟Linux系统；  
    >（推荐原生安装Ubuntu 20.04以上版本，否则可能会缺少组件导致安装失败）  
    >高性能CPU  
    >（将影响编译时间）  
  
**3. 执行安装指令**  
  
由于  

```
