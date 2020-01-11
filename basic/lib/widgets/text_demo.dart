import 'package:flutter/material.dart';

String body = '''
君不见，黄河之水天上来，奔流到海不复回。
君不见，高堂明镜悲白发，朝如青丝暮成雪。
人生得意须尽欢，莫使金樽空对月。
天生我材必有用，千金散尽还复来。
烹羊宰牛且为乐，会须一饮三百杯。
岑夫子，丹丘生，将进酒，杯莫停。
与君歌一曲，请君为我倾耳听。
钟鼓馔玉不足贵，但愿长醉不复醒。
古来圣贤皆寂寞，惟有饮者留其名。
陈王昔时宴平乐，斗酒十千恣欢谑。
主人何为言少钱，径须沽取对君酌。
五花马，千金裘，呼儿将出换美酒，
与尔同销万古愁。
''';

/// 布局容器
class ContainerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.pool,
              size: 32.0,
              color: Colors.white,
            ),

            /// 背景色
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(20.0),
            width: 90.0,
            height: 90.0,

            /// 盒模型
            decoration: BoxDecoration(

                /// 背景色
                color: Color.fromRGBO(3, 54, 255, 1),

                /// 边框
                border: Border.all(
                  color: Colors.indigoAccent[100],
                  width: 3.0,
                  style: BorderStyle.solid,
                ),

                /// 设置四个圆角
                // borderRadius: BorderRadius.circular(24.0),
                /// 圆形快捷方式
                shape: BoxShape.circle,

                /// 渐变效果
//                gradient: RadialGradient(colors: [
//                  Color.fromRGBO(7, 102, 255, 1.0),
//                  Color.fromRGBO(3, 28, 128, 1.0)
//                ]),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(7, 102, 255, 1.0),
                    Color.fromRGBO(3, 28, 128, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),

                /// 阴影
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.0, 16.0),
                    color: Color.fromRGBO(16, 20, 188, 1.0),
                    blurRadius: 25.0,
                    spreadRadius: -9.0,
                  )
                ]),
          )
        ],
      ),
    );
  }
}

/// 文本组件
class TextDemo extends StatelessWidget {
  final String _title = '将进酒';
  final String _author = '李白';
  final TextStyle _textStyle = TextStyle(fontSize: 22.0);

  @override
  Widget build(BuildContext context) {
    return Text(
      '《$_title》 $_author $body',
      textAlign: TextAlign.left,
      style: _textStyle,
    );
  }
}

/// 富文本
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: '将进酒',
          style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 34.0, fontStyle: FontStyle.italic),
          children: [
            TextSpan(
                text: '李白',
                style: TextStyle(fontSize: 17.0, color: Colors.black, fontStyle: FontStyle.normal))
          ]),
    );
  }
}
