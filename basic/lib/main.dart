import 'package:flutter/material.dart';
import 'package:flutter_app/routes/navigation_demo.dart';
import 'package:flutter_app/widgets/base_layout.dart';
import 'package:flutter_app/widgets/bottom_navigation_bar_demo.dart';
import 'package:flutter_app/widgets/drawer_demo.dart';
import 'package:flutter_app/widgets/grid_view_demo.dart';
import 'package:flutter_app/widgets/image_demo.dart';
import 'package:flutter_app/widgets/list_view_demo.dart';
import 'package:flutter_app/widgets/page_view.dart';
import 'package:flutter_app/widgets/sliver_demo.dart';
import 'package:flutter_app/widgets/text_demo.dart';

void main() => runApp(MyApp());

/// App启动入口
class MyApp extends StatelessWidget {
  final String _title = 'flutter';

  @override
  Widget build(BuildContext context) {
    /// 使用MaterialApp组件
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
      ),
      home: NavigationDemo(),
//      initialRoute: '/about',
      routes: {
        '/about': (context) => RouterPage(
              title: 'about',
            ),
        '/think': (context) => RouterPage(
              title: 'think',
            ),
      },
//      home: Home(_title),
//      home: SliverDemo(),
    );
  }
}

/// 主页面Home
class Home extends StatelessWidget {
  final String _title;

  Home(this._title);

  _menuPressed() {
    print('_menuPress');
  }

  _searchPressed() {
    print('_searchPressed');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.menu), tooltip: '导航栏', onPressed: _menuPressed),
          title: Text(_title, style: TextStyle(fontSize: 20.0)),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索',
              onPressed: _searchPressed,
            )
          ],
          elevation: 0.0,
          bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 1.5,
              tabs: [
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_array)),
              ]),
        ),
        body: TabBarView(children: [
          ListViewDemo(),
          SliverDemo(),
          ContainerDemo(),
          GridViewDemo(),
        ]),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
