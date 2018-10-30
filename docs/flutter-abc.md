# Flutter 入门指南

* 安装
* VS Code 编辑器配置
* 体验 Flutter

## 安装

### 系统要求：
安装之前，需要检查一下系统要求：

* 操作系统：macOS (64-bit)
* 磁盘空间：700MB（不包括 IDE 和相关工具）
* 相关工具：Flutter 需要依赖一些命令行功能
    * bash
    * mkdir
    * rm
    * git
    * curl
    * unzip
    * which

### 获取 Flutter SDK

* 下载最新版本 Flutter SDK：https://flutter.io/sdk-archive/#macos
* 解压到所需位置，例如：

```
cd ~/development
unzip ~/Downloads/flutter_macos_v0.5.1-beta.zip
```

* 增加 `flutter` 相关工具到 path 中

```
export PATH=`pwd`/flutter/bin:$PATH
```

此时只能暂时针对当前命令行窗口设置 PATH 变量，想要永久的将 Flutter 添加到 PATH 中，请参考 **环境变量更新** 小结。

### Flutter doctor
运行以下命令查看是否需要安装其它依赖项，来完成全部安装：

```
flutter doctor
```

这个命令会检查你的开发环境并在命令行窗口显示检查结果。Dart SDK 已经包含在 Flutter 了，没有必要独立安装 Dart 了。仔细观察输出的结果，仔细检查命令行输出以获取可能需要安装的其他软件或进一步需要执行的任务（以粗体显示）。例如：

```
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel beta, v0.9.4, on Mac OS X 10.14 18A391, locale zh-Hans-CN)
[!] Android toolchain - develop for Android devices (Android SDK 28.0.1)
    ✗ Android SDK file not found: /development/android-sdk/platforms/android-28/android.jar.
[!] iOS toolchain - develop for iOS devices (Xcode 10.0)
    ✗ libimobiledevice and ideviceinstaller are not installed. To install, run:
        brew install --HEAD libimobiledevice
...
```

一般的错误会是 xcode 或者 Android Studio 版本过低、或者没有 `ANDROID_HOME` 环境变量等，请按照提示解决。

### 环境变量更新
你在命令行职能更新当前会话框的 PATH 变量，通过如下步骤可以让 `flutter` 命令允许在任何终端中：

* 确定 Flutter SDK 目录：`[PATH_TO_FLUTTER_SDK]`
* 打开（或创建） `$HOME/.bash_profile` 文件
* 添加 Flutter SDK 到 `bash_profile` 文件中

```
export PUB_HOSTED_URL=https://pub.flutter-io.cn //国内用户需要设置
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn //国内用户需要设置
export PATH=PATH_TO_FLUTTER_SDK/flutter/bin:$PATH
```

* 运行 `source $HOME/.bash_profile`
* 通过运行 `echo $PATH` 验证

### iOS 设置

### Android 设置

## VS Code 编辑器配置
* 安装 VS Code
* 安装 Flutter 插件
* 验证安装
    * View > Command Palette…
    * 输入 `doctor`, 选择 `Flutter: Run Flutter Doctor`
    * 查看输出

## 体验 Flutter
* 创建 App
    * 启动 VS Code
    * View > Command Palette
    * 输入 `flutter`，选择 `Flutter: New Project`
    * 输入项目名称
    * 指定项目文件夹
    * 等待项目创建成功
* 启动 App
    * 找到 VS Code 状态栏
    * 在 `Device Selector` 的地方选择一个设备
    * Debug > Start Debugging Or F5
    * 等待 App 启动
* 体验热加载
    * 打开 `lib/main.dart`
    * 将字符串 `'You have pushed the button this many times:'` 改成 `'You have clicked the button this many times:'`
    * 保存，模拟器的内容随之改变

参考：https://flutter.io/setup-macos/