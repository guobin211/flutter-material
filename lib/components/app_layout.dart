import 'package:flutter/material.dart';
import 'package:fluttermaterial/components/my_icon_badge.dart';
import 'package:fluttermaterial/components/my_stack_box.dart';

class AppLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(100, 100, 100, 0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyIconBadge(Icons.ac_unit),
              MyIconBadge(Icons.four_k),
              MyIconBadge(Icons.save),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyIconBadge(Icons.access_alarm),
              MyIconBadge(Icons.access_time),
              MyIconBadge(Icons.accessibility),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyStackBox(),
            ],
          ),
        ],
      ),
    );
  }
}
