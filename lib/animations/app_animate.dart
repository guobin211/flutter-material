///
/// app_animate.dart
/// @Date 2020-06-13
/// @Author GuoBin<guobin201314@gmail.com>
/// @Project flutter-material
///
import 'package:flutter/material.dart';

class AppAnimate extends StatefulWidget {
  @override
  _AppAnimateState createState() => _AppAnimateState();
}

class _AppAnimateState extends State<AppAnimate>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;
  Animation _animationColor;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _animation =
        Tween<double>(begin: 32.0, end: 100.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            print("_animation status: $status");
          });

    _animationColor = ColorTween(begin: Colors.redAccent, end: Colors.red[900])
        .animate(_animationController)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((status) {
            print("_animationColor status: $status");
          });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  _pressed() {
    print("_pressed");
    switch (_animationController.status) {
      case AnimationStatus.completed:
        {
          _animationController.reverse();
        }
        break;
      case AnimationStatus.dismissed:
        {
          _animationController.forward();
        }
        break;
      default:
        {
          return;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          onTap: _pressed,
          child: Icon(
            Icons.favorite,
            size: _animation.value,
            color: _animationColor.value,
          ),
        ),
      ),
    );
  }
}
