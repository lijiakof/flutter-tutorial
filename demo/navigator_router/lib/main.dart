import 'package:flutter/material.dart';
import './page1.dart';
import './page3.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigator & router',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Page1(title: 'Flutter Demo Home Page'),
      routes: {
        '/page3': (context) => Page3()
      },
    );
  }
}
