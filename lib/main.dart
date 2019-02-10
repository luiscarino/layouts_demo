import 'package:flutter/material.dart';
import 'package:layouts_demo/cards_widget_example.dart';
import 'package:layouts_demo/grid_view_widget_example.dart';
import 'package:layouts_demo/list_view_widget_example.dart';
import 'package:layouts_demo/row_column.dart';
import 'package:layouts_demo/stack_widget_example.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final String _title = 'Layouts Demo';
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeWidget(title: _title),
    );
  }
}

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedDrawerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_getWidgetTitle(_selectedDrawerIndex)),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: _getDrawerChildren(),
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new GridViewWidget();
      case 1:
        return new ListViewWidget();
      case 2:
        return new StackViewWidget();
      case 3:
        return new CardViewWidget();
      case 4:
        return new RowColumnWidget();
      default:
        return new Text("Error");
    }
  }

  _getWidgetTitle(int pos) {
    switch (pos) {
      case 0:
        return "Grid View";
      case 1:
        return "List View";
      case 2:
        return "Stack";
      case 3:
        return "Cards";
      case 4:
        return "Column/Row";
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  List<Widget> _getDrawerChildren() {
    return <Widget>[
      DrawerHeader(
        child: Text('Flutter widgets', style: TextStyle(fontSize: 18.0, color: Colors.white)),
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
      ),
      ListTile(
        title: Text('Grid View'),
        onTap: () {
          _onSelectItem(0);
        },
      ),
      Divider(),
      ListTile(
        title: Text('List View'),
        onTap: () {
          _onSelectItem(1);
        },
      ),
      Divider(),
      ListTile(
        title: Text('Stack'),
        onTap: () {
          _onSelectItem(2);
        },
      ),
      Divider(),
      ListTile(
        title: Text('Cards'),
        onTap: () {
          _onSelectItem(3);
        },
      ),
      Divider(),
      ListTile(
        title: Text('Row/Column'),
        onTap: () {
          _onSelectItem(4);
        },
      ),
    ];
  }
}