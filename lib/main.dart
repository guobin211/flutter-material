import 'package:flutter/material.dart';
import 'package:fluttermaterial/core/app_theme.dart';
import 'package:fluttermaterial/pages/favorite_page.dart';
import 'package:fluttermaterial/pages/home_page.dart';
import 'package:fluttermaterial/pages/list_page.dart';
import 'package:fluttermaterial/pages/user_info_page.dart';
import 'package:fluttermaterial/store/data_center.dart';

void main() {
  // 初始化数据
  initGlobalData();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = 'Flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/list': (context) => ListPage(),
        '/home': (context) => HomePage(),
        '/favorite': (context) => FavoritePage(),
        '/user': (context) => UserInfoPage(),
      },
      theme: ThemeData(
        primarySwatch: AppTheme.primarySwatch,
        highlightColor: AppTheme.highlightColor,
        splashColor: AppTheme.splashColor,
        accentColor: AppTheme.accentColor,
      ),
    );
  }
}
