# Dart

* 安装
* Hello world
* 基础语法
    * 基本规则
    * 关键词
    * 变量
    * 数据类型
* 函数
* 运算
* 流程控制
* 类&对象
* 泛型
* 异步的支持

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

* 所有的变量都是 `对象`，每个对象都是通过一个 `类` 实例化的。数字、函数类型甚至是 `null` 都是对象。所有的对象都继承于 `Object` 类。
* 尽管 Dart 是强类型语言，由于 Dart 可以自行推断类型，所以你可以不用声明类型。在上面的代码中，`42` 数字被推断为 int 类型，如果要明确说明不需要类型，请用特殊的类型 `dynamic`。 
* Dart 支持泛型类型，例如 `List<int>`（整数列表）或 `List<dynamic>`（任何类型的对象列表）。
* Dart 支持顶级函数（例如 `main()`），以及绑定到类或者对象的函数（静态或实例的方法），甚至可以在函数内创建函数。
* 同样，Dart 支持顶级变量，以及绑定到类或者对象的变量（静态或实例的变量）。
* 与 Java 不同，Dart 没有 `public`、`protected` 和 `private` 关键词。如果标识符以下划线（_）开头，它就是私有的。
* 标识符可以以字母或下划线（_）开头，后跟这些字符加数字的任意组合。
* Dart 既有表达式（存在运行时值）也有语句（没有运行时值）。例如，条件表达式 `condition ? expr1 : expr2`，它的值是 `expr1` 或 `expr2`。而 `if-else` 语句没有任何值。语句包含一个或多个表达式，但表达式不能直接包含语句。
* Dart 会有两种类型的报错：警告和错误。警告：只会提示你的代码可能无法工作，但不会阻止代码执行。错误会发生在编译时或者运行时，编译时错误会阻止代码执行，运行时错误导致代码执行时发生异常。

### 关键词
参考：https://www.dartlang.org/guides/language/language-tour#keywords

### 变量
下面是一个创建变量和初始化变量的例子：

```
var name = 'Jay';
```

变量存储引用。变量名为 `name` 包含对 `String` 对象的引用，它的值为 “Jay”。

`name` 变量会自动推断为 `String` 类型，你也可以指定类型。如果对象不限于单个类型，可以通过指定 `Object` 或者 `dynamic` 类型来定义一个不限制类型的对象。

```
dynamic name = 'Jay';
```

#### 变量的默认值
未初始化的变量的初始值为 `null`。即使是具有 number 类型的变量最初也是 null，因为 number 类型就像 Dart 其它类型一样都是对象。

```
int lineCount;
assert(lineCount == null);
```

#### Final 和 const
如果你不打算更改变量，可以使用 `final` 或者 `const` 来定义变量。这样变量只能设置一次值，const 变量是编译时常量。下面是创建和初始化一个常量：

```
final name = 'Jay';
final String nikname = 'Lily';
```

我们不能够改变一个常量：

```
name = 'Lee'; // Error: a final variable can only be set once.
```

如果你希望编译时定义常量，请使用 const 来定义变量。如果常量是类级别，请使用 `static const`。当你要设置一个编译时常量，你可以设置一个数字或者字符串、一个常量、甚至是对常量进行运算的结果：

```
const bar = 1000000; // Unit of pressure (dynes/cm2)
const double atm = 1.01325 * bar; // Standard atmosphere
```

更多内容：https://www.dartlang.org/guides/language/language-tour#final-and-const

### 数据类型
Dart 中所有的数据都是对象，包括数字、函数等，它们都继承于 Object，并且默认值都是 null（包括数字）。以下是 Dart 内置数据类型：

* number
    * int
    * double
* string
* boolean
* list (array)
* map
* run
* symbol

## 函数
Dart 是面向对象语言，甚至是函数也是一个对象，它的类型是 `Function`。这意味着函数可以作为一个参数传递给其它函数。你也可以通过 Dart 类型来实例化一个函数。
 
下面是创建函数的例子：

```
bool isNoble(int atomicNumber) {
    return _nobleGases[atomicNumber] != null;
}
```

Dart 推荐为公共接口提供类型，但是如果省略类型仍然有效：

```
isNoble(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}
```

如果函数只有一个表达式，我们可以这样简写：

```
bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
```

`=> expr` 符号是 `{ return expr; }` 简写。

### 可选参数

#### 可选的命名参数
当调用函数是，我们可以通过 `paramName: value` 来指定参数名称，例如：

```
enableFlags(bold: true, hidden: false);
```

定义函数是，也可以用 `{param1, param2, …}` 来指定参数名称：

```
/// Sets the [bold] and [hidden] flags ...
void enableFlags({bool bold, bool hidden}) {...}
```

#### 可选位置参数

#### 参数默认值

### main() 函数
每一个引用必须有一个顶级 `main()` 函数，作为程序的入口。

### 匿名函数

```
var list = ['apples', 'bananas', 'oranges'];
list.forEach((item) {
    print('${list.indexOf(item)}: $item');
});
```

### 语法作用域

```
bool topLevel = true;

void main() {
    var insideMain = true;

    void myFunction() {
        var insideFunction = true;

        void nestedFunction() {
            var insideNestedFunction = true;

            assert(topLevel);
            assert(insideMain);
            assert(insideFunction);
            assert(insideNestedFunction);
        }
    }
}
```

### 闭包

```
/// Returns a function that adds [addBy] to the
/// function's argument.
Function makeAdder(num addBy) {
    return (num i) => addBy + i;
}

void main() {
    // Create a function that adds 2.
    var add2 = makeAdder(2);

    // Create a function that adds 4.
    var add4 = makeAdder(4);

    assert(add2(3) == 5);
    assert(add4(3) == 7);
}
```

### 返回值


## 运算
参考：https://www.dartlang.org/guides/language/language-tour#operators

## 流程控制

* if and else
* for loops
* while and do-while loops
* break and continue
* switch and case
* assert

以上条件语句基本上很多语言都有了，就不用一一举例了。但是要介绍一下 assert，它就像我们单元测试的断言一样，通过它可以判断传入的条件语句的真与假：

```
// Make sure the variable has a non-null value.
assert(text != null);

// Make sure the value is less than 100.
assert(number < 100);

// Make sure this is an https URL.
assert(urlString.startsWith('https'));
```

## 类&对象
Dart 是面向对象的语言，具有类和 `mixin-based` 的继承。每个对象都是一个类的实例，所有的类都继承于 `Object`。基于 `mixin-based` 的继承意味着，每个类只会有一个超类，但是类可以可以在多个类层次结构中重用。

### 类的成员
对象中类的成员包括函数和数据。当你调用一个函数时时，可以通过一个对象来调用，这种方式可以访问对象的函数和数据。

使用 `.` 来访问对象实例的数据和函数：

```
var p = Point(2, 2);

// Set the value of the instance variable y.
p.y = 3;

// Get the value of y.
assert(p.y == 3);

// Invoke distanceTo() on p.
num distance = p.distanceTo(Point(4, 4));
```

使用 `?.` 代替 `.` 可以防止运算结果为 null 的异常。

```
// If p is non-null, set its y value to 4.
p?.y = 4;
```

### 构造函数
你可以通过构造函数来创建一个对象。构造函数可以通过 `ClassName` 或者 `ClassName.identifier` 来命名。例如：

```
var p1 = Point(2, 2);
var p2 = Point.fromJson({x: 1, y: 2});
```

通过 `new` 关键词也可以来创建一个对象：

```
var p1 = new Point(2, 2);
var p2 = new Point.fromJson({'x': 1, 'y': 2});
```

### 获取对象的类型
在运行时可以通过 Object 的 `runtimeType` 属性来获取对象的类型：

```
print('The type of a is ${a.runtimeType}');
```

到此为止，你已经知道如何使用类。接下来的部分讲告诉你如何实现类。

### 实例变量
下面是如何定义实例的变量：

```
class Point {
  num x; // Declare instance variable x, initially null.
  num y; // Declare y, initially null.
  num z = 0; // Declare z, initially 0.
}
```

所有的未初始化的实例的变量为 `null`。

所有实例变量都会隐式生成 `getter` 和 `setter` 函数：

```
class Point {
    num x;
    num y;
}

void main() {
    var point = Point();
    point.x = 4; // Use the setter method for x.
    assert(point.x == 4); // Use the getter method for x.
    assert(point.y == null); // Values default to null.
}
```

### 构造函数
我们可以通过创建一个与类名相同的函数来定义一个构造函数。

```
class Point {
    num x, y;

    Point(num x, num y) {
        // There's a better way to do this, stay tuned.
        this.x = x;
        this.y = y;
    }
}
```

`this` 关键词是当前实例的引用。

将构造函数的参数赋值给实例是一个常见的操作，Dart 可以简单的操作：

```
class Point {
    num x, y;

    Point(this.x, this.y);
}
```

如果你没有定义构造函数，会有默认一个私有的构造函数。默认构造函数没有参数，并且在超类中调用无参数构造函数。

### 类的方法


## 泛型

## 异步的支持


https://www.dartlang.org/guides/language/language-tour






