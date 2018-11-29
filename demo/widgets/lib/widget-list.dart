import 'package:flutter/material.dart';

class WidgetList extends StatelessWidget {
  
  final List<String> listData = ['a', 'b', 'c', 'd'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          String item = listData[index];
          return ListTile(
            title: Text(item),
            subtitle: Text(index.toString()),
          );
        },
      ),
    );
  }
}