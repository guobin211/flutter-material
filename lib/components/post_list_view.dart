import 'package:flutter/material.dart';
import 'package:fluttermaterial/mock/post.dart';

class PostListView extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    final item = posts[index];
    return Container(
      child: Column(
        children: <Widget>[
          Image.network(item.imageUrl),
          SizedBox(
            height: 16.0,
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            item.author,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}
