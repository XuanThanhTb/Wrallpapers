import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers/screen/home.dart';

class HomeLoad extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeLoadState();
  }
}
class HomeLoadState extends State<HomeLoad>{
  @override
  void initState() {
    super.initState();
    loadData();
  }

Future<Timer> loadData() async{
  return Timer(Duration(seconds: 4), onDoneLoading);
}

onDoneLoading(){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home()));
}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/images/8.jpg',),
       ),
      ),
      child: Center(
        // child: CircularProgressIndicator(
        //   valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
        // ),
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