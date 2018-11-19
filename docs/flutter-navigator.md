# Flutter Navigaor & routing
Flutter 页面之间的跳转和传值，和大多数前端框架（Vue、React 等）一样，也是采用导航和路由来完成的。但它给开发者提供两种不同的导航机制，一种是`静态路由`，另一种是`动态路由`。顾名思义，`静态路由`跳转的页面的相关参数已经事先确定好了比较难改变，然而`动态路由`跳转的页面相关参数可以在运行时传入从而改变页面的相关数据。

* 导航到新页面
* 导航到新页面并传值
* 将值返回到前一个页面
* 通过路由名称导航到行页面
* 总结

## 导航到新页面
我们可以通过 `Navigator.push` 来完成页面之间的跳转：

```
// main.dart
onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page2()
        )
    );
}
```

如果要返回我们可以通过 `Navigator.pop` 来完成：

```
// page1.dart
onPressed() {
    Navigator.pop();
}
```

## 导航到新页面并传值
将当前页面的值传递到新页面，只需要在构建新页面时，通过页面的构造函数传递给新的页面实例：

```
// main.dart
onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page2(title: 'Hello')
        )
    );
}
```

## 将值返回到前面的页面
通过 `Navigator.pop` 可以将当前页面的参数，返回给它前面页面：

```
// page2.dart
onPressed: () {
    Navigator.pop(context, 'from page2');
}
```

前一个页面：

```
// main.dart
onPressed: () {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page2(title: 'Return'),
        )
    ).then((value) {
        print(value);
    });
}
```

## 通过路由名称导航到行页面
首先要定义一个路由：

```
// main.dart
MaterialApp(
    //...
    routes: {
        '/page3': (context) => Page3()
    },
)
```

然后通过 `Navigator.pushNamed` 来完成页面之间的跳转：

```
// page3.dart
onPressed: () {
    Navigator.pushNamed(context, '/page3');
}
```

## 代码：

* [main.dart](../demo/navigator_router/lib/main.dart)
* [page1.dart](../demo/navigator_router/lib/page1.dart)
* [page2.dart](../demo/navigator_router/lib/page2.dart)
* [page3.dart](../demo/navigator_router/lib/page3.dart)

## 总结
当然这样的`导航路由`设计或许和常规前端框架（Vue、React）有所区别，也许都有自己的好处吧，但是作为 `Vue` 的重度使用者来说，更希望未来 Flutter 的路由（或者第三方插件）更加的简单易用一些，可以借鉴 Web 前端的路由思想，通过路径（例如：`/app/list`）来定义导航的页面，通过路径上的参数（例如：`/app/list?id=123`）定义传递的参数，这样更直观更容易让前端开发工程师理解。

## 参考
* https://flutter.io/docs/development/ui/navigation