# Flutter Navigaor & routing
Flutter 页面之间的跳转和传值，和大多数 UI 框架（Vue、React 等）一样，也是采用导航和路由来完成的。但它给开发者提供两种不同的导航机制，一种是`静态路由`，另一种是`动态路由`。顾名思义，`静态路由`跳转的页面的相关参数已经事先确定好了比较难改变，然而`动态路由`跳转的页面相关参数可以在运行时传入从而改变页面的相关数据。当然这样的设计或许和常规 UI 框架有所区别，也许都有自己的好处吧，但是作为 `Vue` 的重度使用者来说，更希望未来 Flutter 的路由（或者第三方插件）会越来越方便。

* 导航到新页面
* 导航到新页面并传值
* 将值返回到前一个页面
* 通过路由名称导航到行页面
* 跨页面动画

## 导航到新页面
我们可以通过 Navigator.push 来完成页面之间的跳转：

```
onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page2()
        )
    );
}
```

如果要返回我们可以通过 Navigator.pop 来完成：

```
onPressed() {
    Navigator.pop();
}
```

## 导航到新页面并传值
将当前页面的值传递到新页面，只需要在构建新页面时，通过页面的构造函数传递给新的页面实例：

```
onPressed() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Page2(title: 'Hello')
        )
    );
}
```

## 将值返回到前一个页面

## 通过路由名称导航到行页面
首先要定义一个路由：

```
MaterialApp(
    //...
    routes: {
        '/page3': (context) => Page3()
    },
)
```

然后通过 Navigator.pushNamed 来完成页面之间的跳转：

```
onPressed: () {
    Navigator.pushNamed(context, '/page3');
}
```



## 参考
* https://flutter.io/docs/development/ui/navigation
* https://medium.com/@larsenthomasj/from-flutter-to-flight-3-navigation-8d567d2cb011
* https://www.jianshu.com/p/46fbca731434
* https://hk.saowen.com/a/210d24d4a4b13d5691f95d7a4e73fc9eac9b50f73854e1f5f524d11b7b9596f6