import 'package:flutter/material.dart';
import '../pages/home_page.dart';

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
