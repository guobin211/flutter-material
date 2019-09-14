import 'package:flutter/material.dart';
import '../models/post.dart';

///
/// sliver
/// @author GuoBin on 2019-09-13
///

class SliverDemo extends StatelessWidget {
  Widget _buildItem(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // 自动浮动显示
            floating: true,
            // 不固定位置
            pinned: false,
            expandedHeight: 178.0,
            // 弹性伸展空间
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                'https://resources.ninghao.net/images/overkill.png',
                fit: BoxFit.cover,
              ),
              title: Text(
                'hello flutter'.toUpperCase(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverListDemo(),
            ),
          ),
//          SliverGrid(
//              delegate: SliverChildBuilderDelegate(_buildItem,
//                  childCount: posts.length),
//              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                crossAxisCount: 2,
//                crossAxisSpacing: 8.0,
//                mainAxisSpacing: 8.0,
//                childAspectRatio: 1.0,
//              )),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  Widget _buildItem(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.0),
      child: Material(
        borderRadius: BorderRadius.circular(12.0),
        elevation: 14.0,
        shadowColor: Colors.grey.withOpacity(0.5),
        child: Stack(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                posts[index].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 32.0,
                left: 30.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      posts[index].title,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                    Text(
                      posts[index].author,
                      style: TextStyle(fontSize: 13.0, color: Colors.white),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate:
            SliverChildBuilderDelegate(_buildItem, childCount: posts.length));
  }
}
