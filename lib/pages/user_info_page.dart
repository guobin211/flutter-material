import 'package:flutter/material.dart';
import 'package:fluttermaterial/service/http_demo.dart';

class UserInfoPage extends StatefulWidget {
  @override
  _UserInfoPageState createState() => _UserInfoPageState();
}

class _UserInfoPageState extends State<UserInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('userInfo'.toUpperCase()),
      ),
      body: HttpDemo(),
    );
  }
}
