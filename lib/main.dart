import 'package:flutter/material.dart';
import 'package:web_flutter/screens/sandbox.dart';
import '/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Animation',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
