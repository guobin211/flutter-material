import 'dart:async';

///
/// app_stream.dart
/// @Date 2020-06-13
/// @Author GuoBin<guobin201314@gmail.com>
/// @Project flutter-material
///
import 'package:flutter/material.dart';

class AppStream extends StatefulWidget {
  @override
  _AppStreamState createState() => _AppStreamState();
}

class _AppStreamState extends State<AppStream> {
  String _data = 'hello';
  Stream<String> string$;
  StreamSubscription<String> subs$;
  @override
  void initState() {
    super.initState();
    string$ = Stream.fromFuture(fetchData());
    subs$ = string$.listen(
      onData,
      onDone: onDone,
    );
  }

  @override
  void dispose() {
    super.dispose();
    subs$.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_data),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('Add'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: _cancelStream,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<String> fetchData() async {
    await Future.delayed(
      Duration(
        seconds: 3,
      ),
    );
    return 'hello';
  }

  void onData(String data) {
    debugPrint(data);
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDone() {
    debugPrint('string done');
  }

  void onDataTwo(String data) {
    print('onDataTwo: $data');
  }

  void _pauseStream() {
    print('Pause subscription');
  }

  void _resumeStream() {
    print('Resume subscription');
  }

  void _cancelStream() {
    print('Cancel subscription');
  }

  void _addDataToStream() async {
    print('Add data to stream.');

    String data = await fetchData();
  }
}
