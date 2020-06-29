import 'dart:ui';

///
/// MySliverList.dart
/// @author GuoBin 2020-06-29
/// @project flutter_module
///
import 'package:flutter/material.dart';
import 'package:flutter_module/services/album.dart';

class MySliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        buildChild,
        childCount: albums.length,
      ),
    );
  }

  _tapItem(Album el, BuildContext context) {
    // todo
  }

  Widget buildChild(BuildContext context, int index) {
    final Album item = albums[index];

    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Stack(
        children: <Widget>[
          Container(
            height: 220,
            width: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                18.0,
              ),
              image: DecorationImage(
                image: AssetImage(item.url),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12.0,
                    ),
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            height: 220,
            width: 190,
            child: GestureDetector(
              onTap: _tapItem(item, context),
              child: Container(
                height: 220,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    bottomLeft: Radius.circular(12.0),
                  ),
                  image: DecorationImage(
                    image: AssetImage(item.url),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
