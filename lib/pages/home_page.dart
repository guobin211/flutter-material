import 'package:flutter/material.dart';
import 'package:fluttermaterial/components/app_bottom_bar.dart';
import 'package:fluttermaterial/components/app_drawer.dart';
import 'package:fluttermaterial/components/app_tab_view.dart';

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

  _buildTabBar() {
    return TabBar(
      unselectedLabelColor: Colors.black38,
      indicatorColor: Colors.black54,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorWeight: 1.0,
      tabs: <Widget>[
        Tab(
          icon: Icon(Icons.local_florist),
        ),
        Tab(
          icon: Icon(Icons.change_history),
        ),
        Tab(
          icon: Icon(Icons.directions_bike),
        ),
        Tab(icon: Icon(Icons.view_quilt),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "flutter".toUpperCase(),
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
          bottom: _buildTabBar()
      ),
      body: AppTabView(),
      drawer: AppDrawer(),
      bottomNavigationBar: AppBottomBar()
    );
  }
}
