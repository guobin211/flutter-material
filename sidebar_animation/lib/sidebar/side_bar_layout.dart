import 'package:flutter/material.dart';
import 'package:sidebar_animation/home/home_page.dart';

import 'side_bar.dart';


class SideBarLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePage(),
          SideBar()
        ],
      ),
    );
  }

}
