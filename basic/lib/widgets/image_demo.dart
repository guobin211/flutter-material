import 'package:flutter/material.dart';

class ImageDemo extends StatelessWidget {
  final String url =
      "http://imglf3.nosdn0.126.net/img/NE9BOE12MHFIeHpjK0M5QWlWVEk4MTlNN0FCWFdxY1ZQdGIxQWZFVGxWRndzdEdFSmwrb"
      "UxnPT0.jpg?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg";

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ClipOval(
          child: Image.asset(
            "images/img.jpg",
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlueAccent,
            width: 10,
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.greenAccent
            ),
          ],
        ),
    );
  }
}
