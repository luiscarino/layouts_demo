import 'package:flutter/material.dart';

/// Displays row and column widgets and they different attributes
class RowColumnWidget extends StatefulWidget {
  @override
  _RowColumnWidgetState createState() => _RowColumnWidgetState();
}

class _RowColumnWidgetState extends State<RowColumnWidget> {
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  int _mainAxisAlignmentPosition = 0;
  String _mainAxisAlignmentButtonText = "MAA.start";

  MainAxisSize _mainAxisSize = MainAxisSize.min;
  int _mainAxiSizePosition = 0;
  String _mainAxisSizeButtonText = "MAZ.min";

  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;
  int _crossAxisAlignmentPosition = 0;
  String _crossAxisAlignmentButtonText = "CAA.start";

  VerticalDirection _verticalDirection = VerticalDirection.up;
  int _verticalDirectionPosition = 0;
  String _verticalDirectionButtonText = "CAA.up";

  bool _isRow = false;
  String _layoutTypeText = "Column";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // convenience for painting, positioning and sizing widgets
          color: Colors.lightGreen,
          // constraints: BoxConstraints.expand(),
          child: _buildChild(context)),
      persistentFooterButtons: _buildPersistentFooterButtons(),
    );
  }

  List<Widget> _buildPersistentFooterButtons() {
    return <Widget>[
      FlatButton(child: Text(_layoutTypeText), onPressed: _onChangeLayout),
      RaisedButton(
        textColor: Colors.white,
        onPressed: _updateMAA,
        child: Text(_mainAxisAlignmentButtonText),
      ),
      RaisedButton(
        textColor: Colors.white,
        child: Text(_mainAxisSizeButtonText),
        onPressed: _updateMAZ,
      ),
      RaisedButton(
        textColor: Colors.white,
        child: Text(_crossAxisAlignmentButtonText),
        onPressed: _updateCAA,
      ),
      RaisedButton(
        textColor: Colors.white,
        child: Text(_verticalDirectionButtonText),
        onPressed: _updateVD,
      )
    ];
  }

  Widget _buildChild(BuildContext context) {
    if (_isRow) {
      return _buildRow(context);
    } else {
      return _buildColumn(context);
    }
  }

  Widget _buildColumn(BuildContext context) {
    return Column(
        mainAxisAlignment: _mainAxisAlignment,
        mainAxisSize: _mainAxisSize,
        crossAxisAlignment: _crossAxisAlignment,
        verticalDirection: _verticalDirection,
        children: _buildSampleContentChildren());
  }

  Widget _buildRow(BuildContext context) {
    return Row(
        mainAxisAlignment: _mainAxisAlignment,
        mainAxisSize: _mainAxisSize,
        crossAxisAlignment: _crossAxisAlignment,
        verticalDirection: _verticalDirection,
        children: _buildSampleContentChildren());
  }

  List<Widget> _buildSampleContentChildren() {
    return <Widget>[
      Icon(Icons.android),
      Divider(),
      Icon(Icons.apps),
      Divider(),
      Icon(Icons.mobile_screen_share)
    ];
  }

  void _updateMAA() {
    var values = [
      MainAxisAlignment.start,
      MainAxisAlignment.end,
      MainAxisAlignment.center,
      MainAxisAlignment.spaceBetween,
      MainAxisAlignment.spaceAround,
      MainAxisAlignment.spaceEvenly
    ];

    var buttonTextMap = {
      0: 'start',
      1: 'end',
      2: 'center',
      3: 'space between',
      4: 'space around',
      5: 'space evenly'
    };

    var newIndex;
    var newButtonText;
    if (_mainAxisAlignmentPosition == values.length - 1) {
      newIndex = 0;
      newButtonText = buttonTextMap[0];
    } else {
      newIndex = _mainAxisAlignmentPosition + 1;
      newButtonText = buttonTextMap[newIndex];
    }
    setState(() {
      _mainAxisAlignmentPosition = newIndex;
      _mainAxisAlignment = values[newIndex];
      _mainAxisAlignmentButtonText = "MAA." + newButtonText;
    });
  }

  void _updateMAZ() {
    var values = [MainAxisSize.min, MainAxisSize.max];

    var buttonTextMap = {0: 'min', 1: 'max'};

    var newIndex;
    var newButtonText;
    if (_mainAxiSizePosition == values.length - 1) {
      newIndex = 0;
      newButtonText = buttonTextMap[0];
    } else {
      newIndex = _mainAxiSizePosition + 1;
      newButtonText = buttonTextMap[newIndex];
    }
    setState(() {
      _mainAxiSizePosition = newIndex;
      _mainAxisSize = values[newIndex];
      _mainAxisSizeButtonText = "MAZ." + newButtonText;
    });
  }

  void _updateCAA() {
    var values = [
      CrossAxisAlignment.start,
      CrossAxisAlignment.center,
      CrossAxisAlignment.end,
      CrossAxisAlignment.stretch
    ];

    var buttonTextMap = {0: 'start', 1: 'center', 2: 'end', 3: 'stretch'};

    var newIndex;
    var newButtonText;
    if (_crossAxisAlignmentPosition == values.length - 1) {
      newIndex = 0;
      newButtonText = buttonTextMap[0];
    } else {
      newIndex = _crossAxisAlignmentPosition + 1;
      newButtonText = buttonTextMap[newIndex];
    }
    setState(() {
      _crossAxisAlignmentPosition = newIndex;
      _crossAxisAlignment = values[newIndex];
      _crossAxisAlignmentButtonText = "CAA." + newButtonText;
    });
  }

  void _updateVD() {
    var values = [
      VerticalDirection.up,
      VerticalDirection.down,
    ];

    var buttonTextMap = {
      0: 'up',
      1: 'down',
    };

    var newIndex;
    var newButtonText;
    if (_verticalDirectionPosition == values.length - 1) {
      newIndex = 0;
      newButtonText = buttonTextMap[0];
    } else {
      newIndex = _verticalDirectionPosition + 1;
      newButtonText = buttonTextMap[newIndex];
    }
    setState(() {
      _verticalDirectionPosition = newIndex;
      _verticalDirection = values[newIndex];
      _verticalDirectionButtonText = "VD." + newButtonText;
    });
  }

  void _onChangeLayout() {
    setState(() {
      _isRow = !_isRow;
      _layoutTypeText = _isRow ? "Row" : "Column";
    });
  }
}
