# 编写第一个 Flutter App

* 创建 Flutter App
* 使用外部包
* 增加一个有状态部件
* 创建一个无限滚动列表

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
// lib/main.dart
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

* 如果应用程序正在运行，使用热重载按钮更新正在运行的应用程序。每次单击热重载或保存项目时，都会在正在运行的应用程序中随机选择不同的单词对。这是因为单词对是在 build 方法内部生成的。每次 MaterialApp 需要渲染时或者在 Flutter Inspector 中切换平台时 build 都会运行。
* 代码：
    * [pubspec.yaml](https://raw.githubusercontent.com/chalin/flutter-codelabs/master/startup_namer/2_end_of_use_package/pubspec.yaml)
    * [lib/main.dart](https://raw.githubusercontent.com/chalin/flutter-codelabs/master/startup_namer/2_end_of_use_package/lib/main.dart)

## 增加一个有状态部件
无状态部件是不可变的，这意味着无状态部件的属性不能改变，他们都是最终态。

有状态部件会在部件的生命周期内发生状态变化。实现有状态部件至少需要两个类：一个 `StatefulWidget` 类，它创建了一个 `State` 类的实例。`StatefulWidget` 类它本身是不变的，但是 `State` 类在整个生命周期中一直存在。

* 创建一个小的状态类，在 `main.dart` 的底部：

```
class RandomWordsState extends State<RandomWords> {
    // TODO Add build method
}
```

* 在 `main.dart` 中增加一个有状态 `RandomWords` 部件。除了创建 `State` 类，它几乎没有其它任何功能：

```
class RandomWords extends StatefulWidget {
    @override
    RandomWordsState createState() => new RandomWordsState();
}
```

* 在 `RandomWordsState` 类增加 `build()` 方法：

```
class RandomWordsState extends State<RandomWords> {
    @override
    Widget build(BuildContext context) {
        final wordPair = WordPair.random();
        return Text(wordPair.asPascalCase);
    }
}
```

* 从 MyApp 中删除单词生成代码：

```
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final wordPair = WordPair.random();  // Delete this line

        return MaterialApp(
            title: 'Welcome to Flutter',
            home: Scaffold(
            appBar: AppBar(
                title: Text('Welcome to Flutter'),
            ),
            body: Center(
                //child: Text(wordPair.asPascalCase), // Change the highlighted text to...
                child: RandomWords(), // ... this highlighted text
            ),
            ),
        );
    }
}
```

* 代码：[lib/main.dart](https://raw.githubusercontent.com/chalin/flutter-codelabs/master/startup_namer/3_end_of_add_stateful_widget/lib/main.dart)


## 创建一个无限滚动列表
这一步骤中，你会扩展 `RandomWordsState` 来生成一个单词列表。当用户滚动时，`ListView` 部件显示的列表会无限延长，`ListView` 部件允许你创建惰性列表。

* 在 `RandomWordsState` 类中增加一个 `_suggestions` 列表并且增加一个 `biggerFont` 变量来设置一个字号：

```
class RandomWordsState extends State<RandomWords> {
    final _suggestions = <WordPair>[];

    final _biggerFont = const TextStyle(fontSize: 18.0);
    ...
}
```

* 将 `_buildSuggestions()` 函数添加到 `RandomWordsState` 类中：

```
class RandomWordsState extends State<RandomWords> {
    ...
    Widget _buildSuggestions() {
        return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            // The itemBuilder callback is called once per suggested word pairing,
            // and places each suggestion into a ListTile row.
            // For even rows, the function adds a ListTile row for the word pairing.
            // For odd rows, the function adds a Divider widget to visually
            // separate the entries. Note that the divider may be difficult
            // to see on smaller devices.
            itemBuilder: (context, i) {
            // Add a one-pixel-high divider widget before each row in theListView.
            if (i.isOdd) return Divider();

            // The syntax "i ~/ 2" divides i by 2 and returns an integer result.
            // For example: 1, 2, 3, 4, 5 becomes 0, 1, 1, 2, 2.
            // This calculates the actual number of word pairings in the ListView,
            // minus the divider widgets.
            final index = i ~/ 2;
            // If you've reached the end of the available word pairings...
            if (index >= _suggestions.length) {
                // ...then generate 10 more and add them to the suggestions list.
                _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
            }
        );
    }
}
```

* 在 `RandomWordsState` 类中增加 `_buildRow()` 方法：

```
class RandomWordsState extends State<RandomWords> {
    ...

    Widget _buildRow(WordPair pair) {
        return ListTile(
            title: Text(
            pair.asPascalCase,
            style: _biggerFont,
            ),
        );
    }
}
```

* 更新 `RandomWordsState` 类的 `build` 方法来使用 `_buildSuggestions()`：

```
class RandomWordsState extends State<RandomWords> {
    ...
    @override
    Widget build(BuildContext context) {
        final wordPair = WordPair.random(); // Delete these two lines.
        return Text(wordPair.asPascalCase);
        return Scaffold (
        appBar: AppBar(
            title: Text('Startup Name Generator'),
        ),
        body: _buildSuggestions(),
        );
    }
    ...
}
```

* 修改 MyApp 的方法，修改 title，并且修改 home 设置 `RandomWords` 部件：

```
class MyApp extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
            return MaterialApp(
            title: 'Startup Name Generator',
            home: RandomWords(),
        );
    }
}
```

* 代码：[lib/main.dart](https://raw.githubusercontent.com/chalin/flutter-codelabs/master/startup_namer/4_end_of_infinite_list/lib/main.dart)

参考：https://flutter.io/codelabs/