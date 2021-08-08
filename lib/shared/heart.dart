import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool _isfav = false;

  late AnimationController _controller;
  late Animation<Color?> _animation;
  late Animation<double> _sizeAnimation;
  late Animation _curve;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
  //  _curve = CurvedAnimation(parent: _controller, curve: Curves.slowMiddle) ;

    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.red)
        .animate(_controller);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem(tween: Tween(begin: 30, end: 50), weight: 50),
        TweenSequenceItem(tween: Tween(begin: 50, end: 30), weight: 50),
      ],
    ).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isfav = true;
      } else {
        _isfav = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _animation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            setState(() {
              _isfav ? _controller.reverse() : _controller.forward();
            });
          },
        );
      },
    );
  }
}
