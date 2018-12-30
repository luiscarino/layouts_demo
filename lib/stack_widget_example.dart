import 'package:flutter/material.dart';

class StackViewWidget extends StatefulWidget {
  @override
  _StackViewWidgetState createState() => _StackViewWidgetState();
}

class _StackViewWidgetState extends State<StackViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack"),
      ),
      body: Center(

          child: stack),
    );
  }
}

var stack = Stack(
  alignment: const Alignment(0.6, 0.6),
  children: [
//    Container(color: Colors.green, height: ,),
    CircleAvatar(
      backgroundImage: AssetImage('images/image1.jpg'),
      radius: 100.0,
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
      child: Text(
        'Cosmo C',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ],
);
