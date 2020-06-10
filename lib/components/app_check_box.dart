import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  @override
  _AppCheckBoxState createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  bool _toggle = false;
  double _slider = 0;
  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  _selectDate(context);
                },
                child: Text(
                  _date.toLocal().toString(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _createWidgets() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Switch(
            value: _toggle,
            onChanged: _onChange,
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Text(
            _slider.toInt().toString(),
          ),
          Slider(
            value: _slider,
            max: 10.0,
            activeColor: Colors.blue,
            inactiveColor: Colors.black12,
            onChanged: _onSliderChange,
          ),
        ],
      ),
    ];
  }

  void _onChange(bool value) {
    setState(() {
      _toggle = value;
    });
  }

  void _onSliderChange(double value) {
    setState(() {
      _slider = value;
    });
  }

  void _selectDate(BuildContext context) async {
    DateTime date = await showDatePicker(
      context: context,
      cancelText: '取消',
      confirmText: '确定',
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        new Duration(days: 365),
      ),
      lastDate: DateTime.now().add(
        new Duration(days: 365),
      ),
    );

    if (date == null) {
      return;
    }
    setState(() {
      _date = date;
    });
  }
}
