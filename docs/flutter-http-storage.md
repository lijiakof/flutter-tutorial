# Flutter 网络和存储
网络和存储，都是计算机需要解决的最基本问题，Flutter 也不例外，它提供的 HttpClient 和 SharedPreferences 两个模块是分别来解决网络和存储的，当然还有一些第三方提供的更简单的方式，让我们介绍几个常用的模块：

* HttpClient
* JSON 序列化（dart:convert）
* SharedPreferences

## HttpClient
HttpClient 是 Flutter 提供的 HTTP 网络相关的模块，它属于 `dart.io` 这个包中，通过如下几步可以完成一个 HTTP 请求并获取数据：

* 创建 HttpClient 实例；
* 发起 HTTP 请求；
* 关闭 HTTP 请求；
* 处理响应内容；

```
//...
import 'dart:io';
import 'dart:convert';

//...
get() async {
    HttpClient http = new HttpClient();
    var uri = new Uri.http('api.baichanghui.com', 'productservice/places/search', {
        //'city': '北京'
    });
    var req = await http.getUrl(uri);
    var resp = await req.close();
    if(resp.statusCode == HttpStatus.ok) {
        var json = await resp.transform(utf8.decoder).join();
        var data = jsonDecode(json);
        print(data['places']);
    }
}
```

## JSON 序列化
使用 `dart:convert` 库，可以对数据进行序列化和反序列化：

```
String jsonString = '';
Map data = jsonDecode(jsonString);
```

```
Map data = {
    'name': 'Jay',
    'nickName': 'J'
};

String jsonString = jsonEncode(data);
```

## SharedPreferences
通过 `shared_preferences` 来完成本地存储：

* 引入包： `shared_preferences: ^0.4.3`
* 实例化 SharedPreferences
* 通过存储实例往存储中存放内容 setString(key, value)
* 通过存储实例获取存储内容 getString(key)

```
import 'package:shared_preferences/shared_preferences.dart';
//...


SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString('testKey', 'I am OK');
prefs.getString('testKey');
```
