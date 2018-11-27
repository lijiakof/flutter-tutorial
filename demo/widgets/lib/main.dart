import 'package:flutter/material.dart';
import './widget-basics.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  title(String txt) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Widgets')
      ),
      body: Column(
        children: <Widget>[
          title('Basics'),
          WidgetBasics(),
        ],
      ),
    );
  }
}