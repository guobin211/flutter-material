import 'package:flutter/material.dart';
import 'package:fluttermaterial/mock/post.dart';
import 'package:fluttermaterial/pages/post_show.dart';

class AppPageView extends StatelessWidget {
  Widget _buildPageItem(BuildContext context, int index) {
    Post el = posts[index];
    return GestureDetector(
      onTap: () {
        /// 列表到详情
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => PostShow(post: el),
          ),
        );
      },
      child: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: Image.network(
              el.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            bottom: 12.0,
            left: 12.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  el.title,
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  el.author,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: _buildPageItem,
      itemCount: posts.length,
      scrollDirection: Axis.vertical,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  void _pageIndexChange(int index) {
    debugPrint("page: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0.0),
      child: PageView(
        scrollDirection: Axis.vertical,
        pageSnapping: true,
        reverse: false,
        onPageChanged: _pageIndexChange,
        controller: PageController(
          initialPage: 0,
          keepPage: false,
          viewportFraction: 1.0,
        ),
        children: <Widget>[
          Container(
            color: Colors.brown,
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "one".toUpperCase(),
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            color: Colors.blueGrey,
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "two".toUpperCase(),
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            color: Colors.black87,
            alignment: Alignment(0.0, 0.0),
            child: Text(
              "three".toUpperCase(),
              style: TextStyle(
                fontSize: 32.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
