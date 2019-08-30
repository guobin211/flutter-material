import 'package:flutter/material.dart';

class ListViewDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text("标题"),
          subtitle: Text("详细信息"),
        ),
        ListTile(
          title: Text("标题"),
          subtitle: Text("详细信息"),
        )
      ],   
    );
  }
}