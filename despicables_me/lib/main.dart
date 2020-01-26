import 'package:flutter/material.dart';
import './pages/list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Despicables',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        canvasColor: Colors.white,
        appBarTheme: AppBarTheme(elevation: 0, color: Colors.white),
      ),
      home: ListPage(),
    );
  }
}
