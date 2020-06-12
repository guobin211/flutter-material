///
/// chip_warp.dart
/// @Date 2020-06-12
/// @Author GuoBin<guobin201314@gmail.com>
/// @Project flutter-material
///
import 'package:flutter/material.dart';

class ChipWarp extends StatefulWidget {
  @override
  _ChipWarpState createState() => _ChipWarpState();
}

class _ChipWarpState extends State<ChipWarp> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: <Widget>[
                  Chip(
                    label: Text('Life'),
                  ),
                  Chip(
                    label: Text('Sunset'),
                    backgroundColor: Colors.orange,
                  ),
                  Chip(
                    label: Text('City'),
                    onDeleted: () {},
                    deleteIcon: Icon(Icons.delete),
                    deleteIconColor: Colors.redAccent,
                    deleteButtonTooltipMessage: 'Remove this tag',
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 32.0,
                    // indent: 32.0,
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        onDeleted: () {
                          setState(() {
                            _tags.remove(tag);
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 32.0,
                    // indent: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('ActionChip: $_action'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((tag) {
                      return ActionChip(
                        label: Text(tag),
                        onPressed: () {
                          setState(() {
                            _action = tag;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 32.0,
                    // indent: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('FilterChip: ${_selected.toString()}'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((tag) {
                      return FilterChip(
                        label: Text(tag),
                        selected: _selected.contains(tag),
                        onSelected: (value) {
                          setState(() {
                            if (_selected.contains(tag)) {
                              _selected.remove(tag);
                            } else {
                              _selected.add(tag);
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 32.0,
                    // indent: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text('ChoiceChip: $_choice'),
                  ),
                  Wrap(
                    spacing: 8.0,
                    children: _tags.map((tag) {
                      return ChoiceChip(
                        label: Text(tag),
                        selectedColor: Colors.black,
                        selected: _choice == tag,
                        onSelected: (value) {
                          setState(() {
                            _choice = tag;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
