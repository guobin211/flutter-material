import 'package:despicables_me/models/character.dart';
import 'package:flutter/material.dart';

import '../styleguide.dart';
import '../widgets/card_widget.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  PageController _pageController;

  int currentIndex = 0;

  List<Widget> buildPageViews() {
    List<Widget> _child = List();
    for (var i = 0; i < characters.length; ++i) {
      _child.add(
        CardWidget(
          character: characters[i],
          currentPage: i,
          pageController: _pageController,
        ),
      );
    }
    return _child;
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 1.0,
      initialPage: currentIndex,
      keepPage: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            print("pressed icon");
          },
          icon: Icon(Icons.arrow_back),
        ),
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
              Expanded(
                child: PageView(controller: _pageController, children: buildPageViews()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
