import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Page2({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Page2 createState() => _Page2();
}

class _Page2 extends State<Page2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2-${widget.title}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('Back'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          RaisedButton(
            child: Text('Back & return'),
            onPressed: () {
              Navigator.pop(context, 'from page2');
            },
          )
        ],
      ),
    );
  }
}