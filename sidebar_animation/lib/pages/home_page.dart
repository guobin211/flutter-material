import 'package:flutter/material.dart';
import '../constants/navigation_bloc.dart';

class HomePage extends StatelessWidget with NavBlocStates {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("HomePage",
        style: TextStyle(
            fontSize: 36.0,
            fontWeight: FontWeight.w600,
            color: Colors.black
        ),
      ),
    );
  }
}
