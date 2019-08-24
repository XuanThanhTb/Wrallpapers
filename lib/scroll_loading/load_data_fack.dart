import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers/show_list_images/show_image.dart';

class HomeLoadingFack extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeLoadingFackState();
  }
}
class HomeLoadingFackState extends State<HomeLoadingFack>{
  @override
  void initState() {
    super.initState();
    loadData();
  }

Future<Timer> loadData() async{
  return Timer(Duration(seconds: 3), onDoneLoading);
}

onDoneLoading(){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomeShowImages()));
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text('Loading...', textAlign: TextAlign.center, style: TextStyle(fontSize: 18, color: Colors.black45,),),
            ),
          ],
        ),
      ),
    );
  }
}