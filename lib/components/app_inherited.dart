///
/// app_inherited.dart
/// @Date 2020-06-13
/// @Author GuoBin<guobin201314@gmail.com>
/// @Project flutter-material
///
import 'package:flutter/material.dart';

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;
  const CounterProvider(
    this.count,
    this.increaseCount, {
    Key key,
    @required Widget child,
  })  : assert(child != null),
        super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount =
        CounterProvider.of(context).increaseCount;
    return Container(
      child: ActionChip(
        label: Text(
          '$count',
        ),
        onPressed: increaseCount,
      ),
    );
  }
}

class AppInherited extends StatefulWidget {
  @override
  _AppInheritedState createState() => _AppInheritedState();
}

class _AppInheritedState extends State<AppInherited> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: CounterProvider(
            _count,
            _increaseCount,
            child: CounterWrapper(),
          ),
        ),
        FloatingActionButton(
          child: Text('add'),
          onPressed: _increaseCount,
        ),
      ],
    );
  }
}
