import 'package:flutter/material.dart';
import 'package:wallpapers/screen/home.dart';
import 'package:wallpapers/screen/wallpaper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/detailImages': (context) => DetailImages(),
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}