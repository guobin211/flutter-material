import 'package:flutter/material.dart';
import '../models/post.dart';

class ListViewDemo extends StatelessWidget {
  final double _fontSize = 32.0;
  /// item weiget
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].author,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].title,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(

        /// 垂直滚动
        scrollDirection: Axis.vertical,
        itemCount: posts.length,
        itemBuilder: _pageItemBuilder);
  }
}