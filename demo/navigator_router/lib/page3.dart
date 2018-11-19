import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  Page3({Key key}) : super(key: key);

  @override
  _Page3 createState() => _Page3();
}

class _Page3 extends State<Page3> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Page3 Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}