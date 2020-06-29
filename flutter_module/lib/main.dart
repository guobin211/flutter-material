import 'package:flutter/material.dart';
import 'package:flutter_module/pages/HomePage.dart';
import 'package:flutter_module/pages/MusicListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "/": (context) => HomePage(),
        "/list": (context) => MusicListPage(),
      },
      initialRoute: "/",
    );
  }
}
