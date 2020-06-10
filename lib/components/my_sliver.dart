import 'package:flutter/material.dart';
import 'package:fluttermaterial/mock/post.dart';

/// 空白页
/// 自定义滚动页
class MySliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Flutter Sliver',
                style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              background: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/bg/sliver-bg.png',
                ),
              ),
            ),
            expandedHeight: 178.0,
          ),
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(4.0),
              sliver: MySliverList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// 构造方法
Widget buildItem(BuildContext context, int index) {
  final post = posts[index];
  return Container(
    child: Image.network(
      post.imageUrl,
      fit: BoxFit.cover,
    ),
  );
}

/// 网格视图
class MySliverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        buildItem,
        childCount: posts.length,
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

/// 列表视图
class MySliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          final post = posts[index];
          return Padding(
            padding: EdgeInsets.only(
              bottom: 32.0,
            ),
            child: Material(
              type: MaterialType.card,
              elevation: 14.0,
              shadowColor: Colors.grey.withOpacity(1),
              borderRadius: BorderRadius.circular(14.0),
              child: Stack(
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14.0),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          post.title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                          ),
                        ),
                        Text(
                          post.author,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
