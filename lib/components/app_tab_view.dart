import 'package:flutter/material.dart';

class AppTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      Text("1"),
      Text("2"),
      Text("3"),
      Text("4")
    ]);
  }
}
