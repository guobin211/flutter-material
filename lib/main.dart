import 'package:flutter/material.dart';
import 'package:fluttermaterial/core/app_theme.dart';
import 'package:fluttermaterial/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String _title = 'Flutter';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
      },
      theme: ThemeData(
        primarySwatch: AppTheme.primarySwatch,
        highlightColor: AppTheme.highlightColor,
        splashColor: AppTheme.splashColor,
        accentColor:  AppTheme.accentColor,
      ),
    );
  }
}


