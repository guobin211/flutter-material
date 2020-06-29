///
/// HomePage.dart
/// @author GuoBin 2020-06-28
/// @project flutter_module
///
import 'package:flutter/material.dart';
import 'package:flutter_module/widgets/MySliverList.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
//            backgroundColor: Color.fromRGBO(255, 255, 255, 0.1),
            floating: false,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/bg/singer1.jpeg",
                ),
              ),
            ),
            expandedHeight: 180.0,
          ),
          SliverSafeArea(
            top: false,
            sliver: SliverPadding(
              padding: EdgeInsets.all(15.0),
              sliver: MySliverList(),
            ),
          ),
        ],
      ),
    );
  }
}
