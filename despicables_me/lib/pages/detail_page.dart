import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../models/character.dart';
import '../styleguide.dart';

class DetailPage extends StatefulWidget {
  final Character character;
  final double hiddenClips = -330;
  final double closeClips = -250;
  final double openClips = 0;

  DetailPage({this.character});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with AfterLayoutMixin<DetailPage> {
  double bottomPosition = -330;
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: "background-${widget.character.name}",
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: widget.character.colors,
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 16),
                    child: IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.close),
                      color: Colors.white.withOpacity(0.9),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Hero(
                      tag: "image-{$characters[0].name}",
                      child: Image.asset(widget.character.imagePath, height: screenHeight * 0.45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
                    child: Hero(
                      tag: "name-${characters[0].name}",
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(widget.character.name, style: AppTheme.heading),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 8, 32),
                    child: Text(widget.character.description, style: AppTheme.subHeading),
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              curve: Curves.bounceInOut,
              left: 0,
              right: 0,
              bottom: bottomPosition,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    InkWell(
                      onTap: _onTap,
                      child: Center(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          height: 80,
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: Text(
                            "Clips",
                            style: AppTheme.subHeading.copyWith(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _clipsWidget(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _clipsWidget() {
    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              _colorBlock(Colors.redAccent),
              SizedBox(
                height: 20,
              ),
              _colorBlock(Colors.greenAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              _colorBlock(Colors.yellowAccent),
              SizedBox(
                height: 20,
              ),
              _colorBlock(Colors.blueAccent),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              _colorBlock(Colors.black54),
              SizedBox(
                height: 20,
              ),
              _colorBlock(Colors.lightGreen),
            ],
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            children: <Widget>[
              _colorBlock(Colors.deepPurple),
              SizedBox(
                height: 20,
              ),
              _colorBlock(Colors.cyan),
            ],
          ),
          SizedBox(
            width: 16,
          ),
        ],
      ),
    );
  }

  Widget _colorBlock(Color color) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 300), _initOpen);
  }

  _initOpen() {
    setState(() {
      isOpened = false;
      bottomPosition = widget.closeClips;
    });
  }

  _onTap() {
    setState(() {
      bottomPosition = isOpened ? widget.closeClips : widget.openClips;
      isOpened = !isOpened;
    });
  }
}
