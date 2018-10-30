# 编写第一个 Flutter App

* 创建 Flutter App
* 使用外部包
* 增加一个有状态部件
* 创建一个无限滚动列表
* 导航到一个新页面
* 修改主题

## 创建 Flutter App

* View > Command Palette… > Flutter: New Project
* 输入项目名称 `my_app`
* 修改 `lib/main.dart` 的内容：

```
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

* Debug > Start Debugging Or F5

## 使用外部包

* 在 [pub.dartlang.org](https://pub.dartlang.org) 找到 `english_words` 包
* pubspec 文件管理 Flutter 项目的资源。在 `pubspec.yaml` 中，将 `english_words` 增加到依赖表中

```

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.2
  english_words: ^3.1.0
```

* 此时 VS code 会运行 `flutter packages get` 获取最新的依赖包。你可以考到控制台的如下内容：

```
[my_app] flutter packages get
Running "flutter packages get" in my_app...                      4.1s
exit code 0
```

* 在 `lib/main.dart`，文件中导入 `english_words` 包

```
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
```

* 使用 `english_words` 包

```
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); // use english_words package
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          // child: Text('Hello World'), // Replace the highlighted text...
          child: Text(wordPair.asCamelCase), // With this highlighted text.
        ),
      ),
    );
  }
}
```

* 如果应用程序正在运行，使用热重载按钮更新正在运行的应用程序。每次单击热重载或保存项目时，都会在正在运行的应用程序中随机选择不同的单词对。 这是因为单词对是在 build 方法内部生成的。每次MaterialApp 需要渲染时或者在 Flutter Inspector 中切换平台时 build 都会运行。

## 增加一个有状态部件




https://flutter.io/codelabs/