import 'package:flutter/material.dart';
import 'package:wallpapers/screen/wallpaper.dart';
import 'package:wallpapers/scroll_loading/loading.dart';

void main() => runApp(MaterialApp(
   debugShowCheckedModeBanner: false,
   home: HomeLoad(),
));

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/detailImages': (context) => DetailImages(),
      },
    );
  }
}