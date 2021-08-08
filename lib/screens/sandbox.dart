import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  @override
  _SandBoxState createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _opacity = 1;
  double _margin = 0;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        width: _width,
        color: _color,
        margin: EdgeInsets.all(_margin),
        duration: Duration(seconds: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _margin = 60;
                });
              },
              child: Text('animated'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _margin = 0;
                });
              },
              child: Text('animated margin out'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.cyanAccent;
                });
              },
              child: Text('animated Color'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.blue;
                });
              },
              child: Text('animated Color out'),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Text('Animated opacity')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 1;
                  });
                },
                child: Text('Animated opacity Out ')),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacity,
              child: Text('Hide Me'),
            ),
            // for custom Animation we need to use the TweenAnimationBuilder which helps us to animate the any kind of width based on the tween 0-5
            TweenAnimationBuilder(
              child: Text(
                'Tween simple',
                style: TextStyle(fontSize: 30),
              ),
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: 2),
              builder: (ctx, double _val, child) {
                return Opacity(
                  opacity: _val,
                  child: Padding(
                    padding: EdgeInsets.only(top:_val*1),
                    child: child,
                  ),
                );
              },
            ),
            // TweenAnimationBuilder<Color>(tween:Tween<Color>(begin: Colors.amberAccent,end: Colors.deepOrange), duration: Duration(seconds: 2), builder: (ctx, Color _color,_){
            //   return Text('Tween Color',style: TextStyle(color: _color),);
            // })
          ],
        ),
      ),
    );
  }
}
