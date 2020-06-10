import 'package:flutter/material.dart';

class MyIconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  MyIconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size,color: Colors.white,),
      width: size + 60.0,
      height: size + 60.0,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
