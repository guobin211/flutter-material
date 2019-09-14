import 'package:flutter/material.dart';
import '../models/post.dart';

///
/// $name.dart
/// @author GuoBin on 2019-09-13
///

class MyPageView extends StatelessWidget {
  final double _fontSize = 32.0;
  /// item weiget
  List<Widget> _buildList(int length) {
    return List.generate(length, _generator);
  }

  Widget _generator(int index) {
    return Container(
      color: Colors.grey[300],
      alignment: Alignment(0.0,0.0),
      child: Text('item $index', style: TextStyle(fontSize: 18.0, color: Colors.grey),),
    );
  }

  @override
  Widget build(BuildContext context) {
    /// 网格视图
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.vertical,
      children: _buildList(100),
    );
  }
}


//class MyPageView extends StatelessWidget {
//  final double _fontSize = 32.0;
//  /// item weiget
//  Widget _pageItemBuilder(BuildContext context, int index) {
//    return Stack(
//      children: <Widget>[
//        SizedBox.expand(
//          child: Image.network(
//            posts[index].imageUrl,
//            fit: BoxFit.cover,
//          ),
//        ),
//        Positioned(
//          bottom: 8.0,
//          left: 8.0,
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Text(
//                posts[index].author,
//                style: TextStyle(fontWeight: FontWeight.bold),
//              ),
//              Text(
//                posts[index].title,
//              ),
//            ],
//          ),
//        )
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return PageView.builder(
//
//        /// 垂直滚动
//        scrollDirection: Axis.vertical,
//        itemCount: posts.length,
//        itemBuilder: _pageItemBuilder);
//  }
//}

/// pageview
class PageViewDemo extends StatelessWidget {
  final double _fontSize = 32.0;

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      onPageChanged: (c) => debugPrint('page: $c'),
      controller: PageController(
        initialPage: 0,
        keepPage: false,
        viewportFraction: 1.0,
      ),
      children: <Widget>[
        Container(
          color: Colors.blue,
          alignment: Alignment.center,
          child: Text(
            'one',
            style: TextStyle(fontSize: _fontSize, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.deepPurple,
          alignment: Alignment.center,
          child: Text(
            'two',
            style: TextStyle(fontSize: _fontSize, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
