import 'package:flutter/material.dart';
import 'package:flutter_app/routes/post_detail.dart';
import '../models/post.dart';

/// navigation_demo.dart
/// @author GuoBin on 2019-09-13

class NavigationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('listmenu'.toUpperCase(), style: TextStyle(color: Colors.black),),
      ),
      body: MenuListDemo()
//      Center(
//        child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            FlatButton(
//              onPressed: () {
//                Navigator.pushNamed(context, '/think');
//              },
//              child: Text('think'),
//            ),
//            FlatButton(
//              onPressed: () {
//                Navigator.of(context).push(
//                  MaterialPageRoute(
//                      builder: (BuildContext context) =>
//                          RouterPage(title: 'about')),
//                );
//              },
//              child: Text('about'),
//            )
//          ],
//        ),
//      ),
    );
  }
}

class MenuListDemo extends StatelessWidget {

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover,),
              ),
              SizedBox(height: 16.0,),
              Text(posts[index].title, style: Theme.of(context).textTheme.title,),
              Text(posts[index].author, style: Theme.of(context).textTheme.subhead,),
              SizedBox(height: 16.0,),
            ],
          ),
          /// 水波纹效果
          Positioned.fill(child: Material(color: Colors.transparent, child: InkWell(
            splashColor: Colors.white.withOpacity(0.3),
            highlightColor: Colors.white.withOpacity(0.1),
            onTap: () {
              /// 路由跳转到detail
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PostDetail(post: posts[index],)
              ));
            },
          ),))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: _listItemBuilder,
      itemCount: posts.length,
    );
  }
}


class RouterPage extends StatelessWidget {
  final String title;

  RouterPage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
