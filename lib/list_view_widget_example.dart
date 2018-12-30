import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View"),
      ),
      body: Center(child: ListView(children: _buildListViewTileList(20))),
    );
  }
}

// Generates a list of list tiles for the given count
List<Widget> _buildListViewTileList(int count) {
  return List<Widget>.generate(
  count,
  (int index) =>
    ListTile(
      title: Text('CineArts at the Empire',
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text('85 W Portal Ave'),
      leading: Icon(
      Icons.contacts,
      color: Colors.blue[500],
      )
    )
  );
}