import 'package:flutter/material.dart';
import 'package:layouts_demo/grid_view_widget_example.dart';
import 'package:layouts_demo/list_view_widget_example.dart';
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
      home: StackViewWidget(),
    );
  }
}


