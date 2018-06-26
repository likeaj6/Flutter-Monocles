import 'package:flutter/material.dart';
import 'ui/home/AppHome.dart';

void main() {
  // Routes.initRoutes();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'monocles',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: new AppHome(),
    );
  }
}

