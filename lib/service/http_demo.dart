import 'dart:convert';

///
/// http_demo.dart
/// @Date 2020-06-13
/// @Author GuoBin<guobin201314@gmail.com>
/// @Project flutter-material
///
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var httpClient = http.Client();

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPost(),
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
        print('connectionState: ${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('努力加载中...'),
          );
        }

        if (snapshot.data.isEmpty) {
          return Center(
            child: Text('没有更多数据...'),
          );
        }

        return ListView(
          children: snapshot.data.map<Widget>((item) {
            return ListTile(
              title: Text(item.title),
              subtitle: Text(item.author),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.imageUrl),
              ),
            );
          }).toList(),
        );
      },
    );
  }

  /// 注意处理多种状态
  /// 请求中        waiting
  /// 请求成功
  ///     --数据正常 ok
  ///     --数据异常 error
  /// 请求失败       error
  /// 发生异常       error
  Future<List<Post>> fetchPost() async {
    final resp =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    debugPrint(resp.statusCode.toString());
    if (resp.statusCode == 200) {
      final body = json.decode(resp.body);
      List<Post> posts =
          body['posts'].map<Post>((item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      debugPrint('fetchPost statusCode != 200');
      return [];
    }
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'title': title,
        'description': description,
      };
}
