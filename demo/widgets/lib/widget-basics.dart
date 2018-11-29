import 'package:flutter/material.dart';

class WidgetBasics extends StatelessWidget {
  final List<String> listData = ['a', 'b', 'c', 'd'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basics'),
      ),
      body: Column(
        children: <Widget>[
          Text('Text Widget'),
          Image.network('https://metaimg.baichanghui.com/appdownload.jpg'),
          Icon(Icons.help),
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
        ],
      ),
    );
  }
}