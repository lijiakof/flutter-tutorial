# Flutter 网络和存储
网络和存储，都是计算机需要解决的最基本问题，Flutter 也不例外，它提供的 HttpClient 和 SharedPreferences 两个模块是分别来解决网络和存储的，当然还有一些第三方提供的更简单的方式，让我们介绍几个常用的模块：

* HttpClient
* dart:convert
* 
* SharedPreferences

## HttpClient
HttpClient 是 Flutter 提供的 HTTP 网络相关的模块，它属于 `dart.io` 这个包中，通过如下几步可以完成一个 HTTP 请求并获取数据：

* 创建 HttpClient 实例；
* 发起 HTTP 请求；
* 
