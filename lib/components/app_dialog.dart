/// app_dialog.dart
/// @Date 2020-06-12
/// @Author GuoBin<guobin201314@gmail.com>
/// @Project flutter-material

import 'package:flutter/material.dart';

import 'app_expansion_panel.dart';

class AppDialog extends StatefulWidget {
  @override
  _AppDialogState createState() => _AppDialogState();
}

class _AppDialogState extends State<AppDialog> {
  String selectOption = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: _openDialog,
              child: Text('open dialog'),
            ),
            Text('answer: $selectOption'),
            RaisedButton(
              child: Text('open bottom sheet'),
              onPressed: _openSheet,
            ),
            RaisedButton(
              child: Text('snack bar'),
              onPressed: _openSnackBar,
            ),
            AppExpansionPanel(),
          ],
        ),
      ),
    );
  }

  _openDialog() async {
    final answer = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Select Dialog'),
          children: <Widget>[
            Text(
              '选择一个',
              style: TextStyle(fontSize: 12),
            ),
            SimpleDialogOption(
              child: Text('A'),
              onPressed: () {
                Navigator.pop(context, 'A');
              },
            ),
            SimpleDialogOption(
              child: Text('B'),
              onPressed: () {
                Navigator.pop(context, 'B');
              },
            ),
          ],
        );
      },
    );
    setState(() {
      selectOption = answer;
    });
  }

  _openSheet() {
    Scaffold.of(context).showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12.0),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: <Widget>[
                Icon(Icons.pause_circle_outline),
                SizedBox(
                  width: 16.0,
                ),
                Text('01:30 / 03:30'),
                Expanded(
                  child: Text(
                    'Fix you',
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  _openSnackBar() {
    final snackBar = SnackBar(
      content: Text(
        'Yay! A SnackBar!',
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _headerBuilder(BuildContext context, bool isExpanded) {
    return Container();
  }
}
