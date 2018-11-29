import 'package:flutter/material.dart';

class WidgetDialogs extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogs'),
      ),
      body: Builder(
        builder: (context) => Column(
          children: <Widget>[
            AlertDialog(
              title: Text('Title'),
              content: Text('Content'),
              actions: <Widget>[
                FlatButton(
                  child: Text('Show Dialog'),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Title2'),
                        content: Text('Content2'),
                      )
                    );
                  },
                )
              ],
            ),
            RaisedButton(
              child: Text('Show SnackBar'),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: (){
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text('Hello!'),
                ));
              },
            ),
            RaisedButton(
              child: Text('Show Bottom Sheet'),
              color: Colors.black,
              textColor: Colors.white,
              onPressed: () {
                showBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text('BottomSheet'),
                    );
                  }
                );
              },
            )
          ],
        ),
      ),
    );
  }
}