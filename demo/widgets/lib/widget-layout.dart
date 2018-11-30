import 'package:flutter/material.dart';

class WidgetLayout extends StatelessWidget {

  final items = ['a', 'b', 'c', 'd'];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Layout'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text('Container'),
            // color: Colors.red,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(30),
            height: 250,
            width: 200,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                width: 3, 
                color: Colors.blue
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(20)
              ),
              image: DecorationImage(
                image: NetworkImage('https://metaimg.baichanghui.com/appdownload.jpg')
              )
            ),
            transform: Matrix4.rotationZ(-0.1),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Text('Padding'),
              color: Colors.green,
            ),
          ),
          Center(
            child: Text('Center'),
          ),
          // Positioned(
          //   child: Text('Positioned'),
          // )
          Text('Column'),
          Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ],
          ),
          Text('Row'),
          Row(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.blue,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.green,
                height: 100,
                width: 100,
              ),
            ],
          ),
          Text('Stack'),
          Stack(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 250,
                width: 250,
              ),
              Container(
                color: Colors.blue,
                height: 150,
                width: 150,
              ),
              Positioned(
                left: 100,
                top: 100,
                child: Container(
                  color: Colors.green,
                  height: 80,
                  width: 80,
                ),
              )
            ],
          )
          
        ]
      )
    );
  }
}