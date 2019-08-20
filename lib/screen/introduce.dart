import 'package:flutter/material.dart';

class Introduce extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, size: 30, color: Colors.black,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        title: Text('Giới thiệu App',textAlign: TextAlign.center, style: TextStyle(fontSize: 24, color: Colors.black)),
      ),
      body: Container(
        color: Color(0xffcecece),
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(),
              child: Text('Version: ', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('Developed by: ', style: TextStyle(color: Colors.black, fontSize: 18,)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text('Supported by: ', style: TextStyle(color: Colors.black, fontSize: 18,)),
            ),
            Container(
              color: Color(0xfff2f2f2),
              height: 100,
            )
          ],
        ),
      ),
    );
  }

}