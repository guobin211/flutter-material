import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  @override
  _TextInputState createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  String title;

  _onTitleChange(String v) {
    debugPrint(v);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: _onTitleChange,
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter',
        border: OutlineInputBorder(),
      ),
    );
  }
}
