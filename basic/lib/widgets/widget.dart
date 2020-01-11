import 'package:flutter/material.dart';

/// 有状态Widget组件
class MyWidget extends StatefulWidget {
  MyWidget({Key key, this.title}) : super();

  final String title;

  @override
  _MyStateWidget createState() => _MyStateWidget();
}

/// 实现状态
class _MyStateWidget extends State<MyWidget> {
  int _count = 1;
  String _name = '有状态组件';

  void _addCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _name,
          ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_count',
              style: Theme.of(context).textTheme.display1,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addCount,
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}
