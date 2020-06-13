import 'package:flutter/material.dart';
import 'package:fluttermaterial/components/app_bottom_bar.dart';
import 'package:fluttermaterial/components/app_dialog.dart';
import 'package:fluttermaterial/components/app_drawer.dart';
import 'package:fluttermaterial/components/box_size.dart';
import 'package:fluttermaterial/components/chip_warp.dart';
import 'package:fluttermaterial/components/post_list_view.dart';

import 'common.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 4, child: MyScaffold());
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "home".toUpperCase(),
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
        bottom: buildTabBar([
          Tab(
            icon: Icon(Icons.local_florist),
          ),
          Tab(
            icon: Icon(Icons.change_history),
          ),
          Tab(
            icon: Icon(Icons.directions_bike),
          ),
          Tab(
            icon: Icon(Icons.view_quilt),
          ),
        ]),
      ),
      body: buildTopTabView([
        PostListView(),
        AppDialog(),
        ChipWarp(),
        BoxSize(),
      ]),
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomBar(),
    );
  }
}
