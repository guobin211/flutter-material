import 'package:flutter/material.dart';
import 'package:fluttermaterial/mock/post.dart';

class AppGridView extends StatelessWidget {
  List<Widget> _buildGrids(BuildContext context, int count) {
    return List.generate(count, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          '第 $index 个',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridViewBuild();
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.vertical,
      children: _buildGrids(context, 60),
    );
  }
}

class GridViewBuild extends StatelessWidget {
  Widget _buildItem(BuildContext context, int index) {
    final post = posts[index];
    return Container(
      child: Image.network(
        post.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemBuilder: _buildItem,
        itemCount: posts.length,
      ),
    );
  }
}
