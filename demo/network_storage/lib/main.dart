import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'Network & Storage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

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
      
      print(data['places'][0]['fullName']);
    }
  }

  setData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('testKey', 'I am OK');
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('testKey');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('Get HttpData'),
              onPressed: () { 
                this.get();
              },
            ),
            FlatButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('setData'),
              onPressed: () { 
                this.setData();
              },
            ),
            FlatButton(
              color: Colors.black,
              textColor: Colors.white,
              child: Text('getData'),
              onPressed: () { 
                this.getData();
              },
            ),
          ],
        ),
      ),
    );
  }
}
