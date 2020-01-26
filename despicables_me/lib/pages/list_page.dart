import 'package:despicables_me/styleguide.dart';
import 'package:despicables_me/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 18.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 24.0, top: 8.0),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(text: "Despicables", style: AppTheme.display1),
                    TextSpan(text: "/n"),
                    TextSpan(text: "Characters", style: AppTheme.display2),
                  ]),
                ),
              ),
              Expanded(child: CardWidget())
            ],
          ),
        ),
      ),
    );
  }
}
