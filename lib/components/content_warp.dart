import 'package:flutter/material.dart';
import 'package:fluttermaterial/components/box_size.dart';

class ContentWarp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://resources.ninghao.org/images/say-hello-to-barry.jpg',
          ),
          alignment: Alignment.topCenter,
          fit: BoxFit.fitHeight,
          repeat: ImageRepeat.noRepeat,
          // 滤镜
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.1),
            BlendMode.hardLight,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          BoxSize(),
          RadiusBox(),
        ],
      ),
    );
  }
}
