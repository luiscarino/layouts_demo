import 'package:flutter/material.dart';

class GridViewWidget extends StatefulWidget {
  GridViewWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GridViewWidgetState createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: buildGrid()
      ),
    );
  }
}

Widget buildGrid() {
  return GridView.extent(
      maxCrossAxisExtent: 150.0,
      padding: const EdgeInsets.all(4.0),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      children: _buildGridTileList(4));
}

// Generates a list of images within a container for the given count
List<Container> _buildGridTileList(int count) {
  return List<Container>.generate(
  count,
  (int index) =>
  Container(child: Image.asset('images/image${index+1}.jpg')));
}