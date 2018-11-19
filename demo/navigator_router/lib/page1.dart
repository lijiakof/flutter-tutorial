import 'package:flutter/material.dart';
import './page2.dart';

class Page1 extends StatefulWidget {
  Page1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Page1 createState() => _Page1();
}

class _Page1 extends State<Page1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Navigate to Page2'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context) => Page2()
                  builder: (context) => Page2(title: 'Hello')
                )
              );
            },
          ),
          RaisedButton(
            child: Text('Navigate to Page3'),
            onPressed: () {
              Navigator.pushNamed(context, '/page3');
            },
          )
        ],
      ),
    );
  }
}