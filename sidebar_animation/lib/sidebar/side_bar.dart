import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

import '../constants/app_color.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 300);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationsStatus = _animationController.status;
    final bool isAnimationCompleted = animationsStatus == AnimationStatus.completed;
    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  color: AppColor.primary,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80.0,
                      ),
                      ListTile(
                        title: Text(
                          "GuoBin211",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        subtitle: Text(
                          "guobin211@gmail.com",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40.0,
                        ),
                      ),
                      Divider(
                        height: 64.0,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      MenuItem(
                        icon: Icons.menu,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          log("Home tap");
                        },
                      ),
                      MenuItem(
                        icon: Icons.account_box,
                        title: "Account",
                        onTap: () {
                          onIconPressed();
                          log("Account tap");
                        },
                      ),
                      MenuItem(
                        icon: Icons.shopping_basket,
                        title: "Orders",
                        onTap: () {
                          onIconPressed();
                          log("Orders tap");
                        },
                      ),
                      Divider(
                        height: 64.0,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 16.0,
                        endIndent: 16.0,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Setting",
                      ),
                      MenuItem(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomerMenuClipper(),
                    child: Container(
                      width: 35.0,
                      height: 110.0,
                      color: AppColor.primary,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF1BB5FD),
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomerMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;
    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
