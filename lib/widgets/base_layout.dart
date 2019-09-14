import 'package:flutter/material.dart';

///
/// BaseLayout.dart
/// @author GuoBin on 2019-09-13
///
class BaseLayout extends StatefulWidget {
  @override
  _BaseLayoutState createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        /// flex布局的justify-content
        mainAxisAlignment: MainAxisAlignment.center,

        /// align-items
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          /// 固定宽高比例
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: Container(
              color: Colors.lightBlueAccent,
            ),
          ),

          /// 限制最大宽度和高度
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 100.0, minWidth: 100.0),
            child: Container(
              color: Color.fromRGBO(3, 54, 225, 1.0),
            ),
          ),

          /// 容器
          Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              /// sizebox
              SizedBox(
                width: 200.0,
                height: 200.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(3, 54, 255, 1.0),
                      borderRadius: BorderRadius.circular(32.0)),
                  alignment: Alignment(-1.0, 0.0),
                  child: Icon(
                    Icons.ac_unit,
                    color: Colors.white,
                    size: 32.0,
                  ),
                ),
              ),
              SizedBox(
                height: 32.0,
              ),
              SizedBox(
                width: 100.0,
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(3, 54, 255, 1.0),
                      shape: BoxShape.circle,
                      gradient: RadialGradient(colors: [
                        Colors.amberAccent,
                        Color.fromRGBO(3, 54, 255, 1.0),
                      ])),
                  child: Icon(
                    Icons.brightness_2,
                    color: Colors.amber,
                    size: 32.0,
                  ),
                ),
              ),

              /// absolute定位
              Positioned(
                right: 100.0,
                top: 20.0,
                child: Icon(
                  Icons.access_alarms,
                  color: Colors.white,
                  size: 32.0,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

/// 自定义组件
class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
