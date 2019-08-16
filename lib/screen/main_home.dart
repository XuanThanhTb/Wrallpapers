import 'dart:developer';

import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class MainBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainBodyState();
  }
}
class MainBodyState extends State<MainBody>{

  List<dynamic> gridViewImages= [
   'lib/images/1.jpg',
   'lib/images/2.jpg',
   'lib/images/3.jpg',
   'lib/images/102.jpg',
   'lib/images/102.jpg',
   'lib/images/102.jpg',
   'lib/images/102.jpg',
   'lib/images/102.jpg',
   'lib/images/102.jpg',
   'lib/images/102.jpg',

  ];

  listImages(){
    return Container( 
      height: double.infinity,
      margin: EdgeInsets.only(),
      child:ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text('Trending', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: GestureDetector(
                    child: Text('See all', style: TextStyle(color: Colors.black, fontSize: 16)),
                    onTap: (){
                      seeAll();
                    },
                  )
                )
              ],
            ),
            _caroulImages(),
            _showDetailImages(),
          ],
        ),
      ],
    ),
   );
  }

  _caroulImages(){
    return Container(
      height: 200,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: EdgeInsets.symmetric(),
        child: Carousel(
          dotSize: 5,
          dotIncreaseSize: 2.0,
          borderRadius: true,
          radius: Radius.circular(10.0),
          animationCurve: Curves.easeOutSine,
          animationDuration: Duration(seconds: 5),
          images: [
            AssetImage('lib/images/1.jpg'),
            AssetImage('lib/images/102.jpg'),
            AssetImage('lib/images/3.jpg'),
          ],
      ),
    );
  }

  _showDetailImages(){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('Popular', style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text('See all', style: TextStyle(color: Colors.black, fontSize: 16)),
              )
            ],
          ),
          _gridViewImages(),
        ],
      )
    );
  }

  _gridViewImages(){
    return Container(
      height: 1000,
      child: GridView.builder(itemCount: gridViewImages.length, 
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2/2.8),
      scrollDirection: Axis.vertical,
      controller: new ScrollController(keepScrollOffset: false),
      itemBuilder: (BuildContext buildContext, int index) {
        return showImages(gridViewImages[index], index);
        },
      ),
    );
  }

  showImages(showImagesList, imagesIndex){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 80,
      width: 80,
      child: GestureDetector(
        child: Image.asset('${showImagesList}', fit: BoxFit.cover, height: 80, width: 80,),
        onTap: (){
          Navigator.of(context).pushNamed('/detailImages');
        },
      ),
    );
  }

  seeAll(){

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: listImages(),
      ),
    );
  }
}

