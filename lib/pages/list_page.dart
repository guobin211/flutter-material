import 'package:flutter/material.dart';
import 'package:fluttermaterial/components/app_bottom_bar.dart';
import 'package:fluttermaterial/components/app_drawer.dart';
import 'package:fluttermaterial/components/app_grid_view.dart';
import 'package:fluttermaterial/components/app_layout.dart';
import 'package:fluttermaterial/components/app_page_view.dart';
import 'package:fluttermaterial/components/my_sliver.dart';
import 'package:fluttermaterial/pages/common.dart';

const List<Widget> tabs = [
  Tab(
    icon: Icon(Icons.view_module),
  ),
  Tab(
    icon: Icon(Icons.view_array),
  ),
  Tab(
    icon: Icon(Icons.view_day),
  ),
  Tab(
    icon: Icon(Icons.slideshow),
  ),
];

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: MyScaffold(),
      initialIndex: 0,
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "list".toUpperCase(),
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: null),
        ],
        elevation: 0.0,
        bottom: buildTabBar(tabs),
      ),
      body: buildTopTabView([
        AppGridView(),
        AppPageView(),
        AppLayout(),
        MySliver(),
      ]),
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
