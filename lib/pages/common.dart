import 'package:flutter/material.dart';

TabBar buildTabBar(List<Widget> tabs) {
  return TabBar(
    unselectedLabelColor: Colors.black38,
    indicatorColor: Colors.black54,
    indicatorSize: TabBarIndicatorSize.label,
    indicatorWeight: 1.0,
    tabs: tabs,
  );
}

Widget buildTopTabView(List<Widget> children) {
  return TabBarView(children: children);
}
