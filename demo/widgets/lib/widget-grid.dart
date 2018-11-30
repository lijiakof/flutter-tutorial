import 'package:flutter/material.dart';

class WidgetGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Text(index.toString());
        }),
      )
    );
  }
}