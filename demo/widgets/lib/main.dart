import 'package:flutter/material.dart';
import './widget-basics.dart';
import './widget-form.dart';
import './widget-list.dart';
import './widget-dialogs.dart';
import './widget-layout.dart';
import './widget-grid.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets',
      theme: ThemeData(
        primaryColor: Colors.black,
        primaryColorBrightness: Brightness.dark,
      ),
      home: HomePage(),
      routes: {
        'widget/basics': (context) => WidgetBasics(),
        'widget/form': (context) => WidgetForms(),
        'widget/list': (context) => WidgetList(),
        'widget/dialogs': (context) => WidgetDialogs(),
        'widget/layout': (context) => WidgetLayout(),
        'widget/grid': (context) => WidgetGrid(),
      },
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
        title: Text('Flutter Widgets'),
        actions: <Widget> [
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'item1',
                  child: Text('Item1'),
                ),
                PopupMenuItem(
                  value: 'item2',
                  child: Text('Item2'),
                )
              ];
            }
          )
        ],
      ),
      drawer: Drawer(
        child: Text('Drawer')
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Basics'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, 'widget/basics');
            },
          ),
          ListTile(
            title: Text('Forms'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, 'widget/form');
            },
          ),
          ListTile(
            title: Text('ListView'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, 'widget/list');
            },
          ),
          ListTile(
            title: Text('Dialogs'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              //Navigator.pushNamed(context, 'widget/dialogs');
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => WidgetDialogs()
              ));
            },
          ),
          ListTile(
            title: Text('Layout'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, 'widget/layout');
            },
          ),
          ListTile(
            title: Text('GridView'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              Navigator.pushNamed(context, 'widget/grid');
            },
          ),
        ],
      )
    );
  }
}