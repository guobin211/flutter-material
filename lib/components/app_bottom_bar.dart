import 'package:flutter/material.dart';
import 'package:fluttermaterial/pages/favorite_page.dart';
import 'package:fluttermaterial/pages/home_page.dart';
import 'package:fluttermaterial/pages/list_page.dart';
import 'package:fluttermaterial/pages/user_info_page.dart';
import 'package:fluttermaterial/store/data_center.dart';

class AppBottomBar extends StatefulWidget {
  @override
  _AppBottomBarState createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  int _index = 0;
  void _onTap(BuildContext context, int index) {
    debugPrint('$_index, $index');
    if (index != _index) {
      setData(bottomIndex, index);
      navTo(context, index);
    }
  }

  void navTo(BuildContext context, int index) {
    switch (index) {
      case 0:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        }
        break;
      case 1:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListPage(),
            ),
          );
        }
        break;
      case 2:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritePage(),
            ),
          );
        }
        break;
      case 3:
        {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserInfoPage(),
            ),
          );
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    this.setState(() {
      _index = getData(bottomIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _index,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black54,
      onTap: (i) => _onTap(context, i),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('List'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favorite'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('My'),
        ),
      ],
    );
  }
}
