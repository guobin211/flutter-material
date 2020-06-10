import 'package:flutter/material.dart';

String author = '李白';
String title = '将进酒';
String content = '''
君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。
人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。''';

class RichTextSpan extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
    color: Colors.deepOrangeAccent,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w100,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        text: TextSpan(
          text: '',
          style: _textStyle,
          children: [
            TextSpan(
              text: title,
              style: TextStyle(color: Colors.black87, fontSize: 32.0),
            ),
            TextSpan(
              text: content,
              style: _textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
