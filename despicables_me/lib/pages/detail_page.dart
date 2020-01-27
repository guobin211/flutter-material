import 'package:flutter/material.dart';


import '../models/character.dart';
import '../styleguide.dart';

class DetailPage extends StatefulWidget {
  final Character character;

  DetailPage({this.character});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
            )
          ],
        ),
      ),
    );
  }
}
