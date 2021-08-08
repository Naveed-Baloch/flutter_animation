import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      curve: Curves.bounceIn,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      duration: Duration(seconds: 2),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (ctx, double _val, child) {
        return Opacity(
          opacity: _val,
          child: Padding(
            padding: EdgeInsets.only(top:_val * 10),
            child: child,
          ),
        );
      },
    );
  }
}
