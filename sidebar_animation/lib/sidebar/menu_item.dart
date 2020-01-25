import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function onTap;
  MenuItem({this.icon, this.title, this.onTap});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Icon(icon, color: Colors.cyan),
            SizedBox(width: 20.0,),
            Text(title,
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight:FontWeight.w300,
                ),
            )
          ],
        ),
      ),
    );
  }
}
