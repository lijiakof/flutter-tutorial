# Flutter 部件简介
Flutter 提供了大量的 Widget，种类繁多，就是布局组件就多达 30 个，我们就不一一介绍，只介绍比较常用的一些。在介绍组件之前，我们先了解一下 Flutter 部件的不同种类，在 Flutter 的官方文档中，对所有组件的分类比较混乱，不同大类之间有组件有很多交叉现象，例如：Container 既属于基础部件又属于布局类型的部件；Image 部件同时在基础类型和 Material 类型中，并且还专门为资源类型的部件（Icon、RowImage 等）定义了一个类别。个人感觉它的分类比较混乱，因此我试着重新梳理一下不同的 Flutter 部件类型，以便于学习使用。

* Basics
* Forms and Inputs
* Layout
* Interaction Models
* Animation and Motion
* Painting and effects

![Widgets](../resources/flutter-widgets.png)

## StatelessWidget vs StatefulWidget
在介绍各种不同的部件之前，我们先了解一下什么是`无状态部件`和`有状态部件`。TODO....


## 常用 Widgets

* Basics: 
    * Text & Image & Icon
    * ListView & ListTile
    * Buttons
    * Scaffold & Appbar & Drawer & PopupMenuButton
* Forms and Inputs: 
    * Form
    * TextFormField & TextField 
    * Checkbox & Radio & Switch
* Layout: 
    * Container & Column & Row & Stack & Positioned
* Interaction Models: 
    * BottomSheet 
    * AlertDialog

## 常用基础部件（Basics）

### Text & Icon & Image
Text & Image & Icon 是 UI 中最基础的信息显示部件，这些部件就不做详细的介绍，因为作为前端工程师，用的最多最熟悉的也就是这些部件，直接看代码：

```
Column(
    children: <Widget>[
        Text('Text Widget'),
        Image.network('https://metaimg.baichanghui.com/appdownload.jpg'),
        Icon(Icons.help),
    ]
)

```

### ListView & ListTile
ListView & ListTile 这类组件，主要是解决大量列表数据的展示和交互。ListView 为列表的主体部分，它可以绑定数据集合，并且滚动时可以和远程数据进行交互，当然也可以对列表项的数据进行不同的布局展示。ListTile 为列表项的布局，它是基于 Material Design 设计出来的一种特殊布局的部件。

```

List<String> listData = ['a', 'b', 'c', 'd'];

//...

ListView.builder(
    itemCount: 4,
    itemBuilder: (context, index) {
        String item = listData[index];

        return ListTile(
            title: Text(item),
            subTitle: Text(index)
        );
    }
);
```

### Buttons
在 Flutter 部件中有各种不同风格的按钮，例如：IconButton、FlatButton、RaisedButton、RawMaterialButton 等等，其实它们仅仅是风格不同，用处没有太大的差别：

```
Column(
    children: <Widget>[
        FlatButton(
            color: Colors.black,
            textColor: Colors.white,
            child: Text('Button'),
            onPressed: () { },
        ),
        IconButton(
            icon: Icon(Icons.help),
            iconSize: 20,
            color: Colors.black,
            onPressed: () { },
        )
    ]
)
```

**他们在初始化是，有一个必须要初始化的属性 `onPressed`**

### Scaffold & Appbar & Drawer & PopupMenuButton
这一组部件也是基于 Material Design 设计出来的，它们主要解决 App 的导航、辅助功能等问题，当然它也会帮你适配页面在不同设备下的表现。下面的代码中，会出现上述所有组件，让我们分享一下代码：


```
Scaffold(
    appBar: Appbar(
        title: Text('Title'),
        actions: <Widget> [
            PopupMenuButton(
                itemBuilder: (context) {
                    return [
                        PopupMenuItem(
                            value: '',
                            child: Text('Item1')
                        )
                    ]
                }
            )
        ]
    ),
    drawer: Drawer(
        child: Column(),
    ),
    body: Container(),
)
```

* Scaffold：Material Design 布局结构的基本实现
    * appbar: Appbar：引用程序栏
        * title：标题
        * actions：操作部件
            * PopupMenuButton：弹出菜单按钮
                * PopupMenuItem：菜单项
    * drawer: Drawer：侧边抽屉导航
    * body：应用程序主体

![Widgets-Appbar](../resources/flutter-widgets-appbar.png)

## 表单部件（Forms and Inputs）
我们通过表单来收集用户填写的相关信息，和 Web 中的表单类似，Flutter 提供了表单中常用的文本输入、单选、多选和开关等部件，并且它也提供了基本的表单校验的功能，以及满足我们通常的业务。



## 布局部件（Layout）

