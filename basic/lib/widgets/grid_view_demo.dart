import 'package:flutter/material.dart';
import '../models/post.dart';

///
/// GridViewDemo.dart
/// @author GuoBin on 2019-09-13
///

class GridViewDemo extends StatelessWidget {
  Widget _gridItemBuild(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuild,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//        crossAxisCount: 3,
        maxCrossAxisExtent: 150.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}
