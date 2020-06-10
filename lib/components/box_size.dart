import 'package:flutter/material.dart';

class BoxSize extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(Icons.pool, size: 32.0, color: Colors.white),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(3, 54, 255, 1.0),
        border: Border(
          top: BorderSide(
            color: Colors.indigoAccent[100],
            width: 2.0,
            style: BorderStyle.solid,
          ),
          bottom: BorderSide(
            color: Colors.black,
            width: 4.0,
            style: BorderStyle.solid,
          ),
        ),
      ),
    );
  }
}

class RadiusBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        Icons.access_alarm,
        size: 32.0,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(8.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
        // color: Colors.black,
        border: Border.all(width: 4.0, color: Colors.black26),
        // borderRadius: BorderRadius.circular(45.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(2.0, 14.0),
            color: Colors.black,
            blurRadius: 25.0,
            spreadRadius: -9.0,
          ),
        ],
        shape: BoxShape.circle,
        // gradient: RadialGradient(
        //   colors: [
        //     Color.fromRGBO(7, 102, 255, 1.0),
        //     Color.fromRGBO(3, 28, 128, 1.0),
        //   ],
        // ),
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(7, 102, 255, 1.0),
            Color.fromRGBO(3, 28, 128, 1.0),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),
      ),
    );
  }
}
