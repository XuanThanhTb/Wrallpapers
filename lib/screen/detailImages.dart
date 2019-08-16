import 'package:flutter/material.dart';

class DetailImages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DetailImagesState();
  }
}

class DetailImagesState extends State<DetailImages>{

  showListIndexImages(){
    return Container(
      child: Text('data', textAlign: TextAlign.center,),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: showListIndexImages(),
      ),
    );
  }
}

  