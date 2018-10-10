# Dart

* 安装
* Hello world
* 基础语法
    * 基本规则
    * 变量
    * 数据类型
* 函数
* 运算
* 类&对象
* 泛型

## 安装

* 安装
    * [install homebrew](http://brew.sh/)
    * xcode-select --install
    * brew tap dart-lang/dart
    * brew install dart
* 更新
    * brew update
    * brew upgrade dart
    * brew cleanup dart
* dart --version

## Hello world

```
class Hello {
  say() {
    print('Hello World');
  }
}

main() {
  new Hello().say();
}
```

运行：`dart hello.dart`

## 基础语法

### 基本规则

```
// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
main() {
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
}
```

上面这段程序，几乎使用了 Dart 所有的语法：

#### `//` or `/**/`
注释，`//` 为单行注释，`/**/` 为多行注释。
#### `int`
类型，Dart 还有例如 string、list、boolean 等内置类型。
#### `42`
数字类型字面量。
#### `print()`
显示输出方法。
#### `'...'` or `"..."`
字符串。
#### `$variableName` or `${expression}`
字符串插值。
#### `main()`
主函数，程序的入口。
#### `var`
不指定类型的声明变量。

#### 重要概念

Dart支持泛型类型，如List <int>（整数列表）或List <dynamic>（任何类型的对象列表）。

* 所有的变量都是 `对象`，每个对象都是通过一个 `类` 实例化的。数字、函数类型甚至是 `null` 都是对象。所有的对象都继承于 `Object` 类。
* 尽管 Dart 是强类型语言，由于 Dart 可以自行推断类型，所以你可以不用声明类型。在上面的代码中，`42` 数字被推断为 int 类型，如果要明确说明不需要类型，请用特殊的类型 `dynamic`。 
* Dart 支持泛型类型，例如 `List<int>`（整数列表）或 `List<dynamic>`（任何类型的对象列表）。
* Dart 支持顶级函数（例如 `main()`），以及绑定到类或者对象的函数（静态或实例的方法），甚至可以在函数内创建函数。
* 

### 变量

### 数据类型
Dart 中所有的数据都是对象，包括数字、函数等，它们都继承于 Object，并且默认值都是 null（包括数字）

Dart 内置数据类型

* number
    * int
    * double
* string
* boolean
* list (array)
* map
* run
* symbol

https://www.dartlang.org/guides/language/language-tour






