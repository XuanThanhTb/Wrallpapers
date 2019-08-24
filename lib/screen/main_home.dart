import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:wallpapers/all_images/see_all_images.dart';
import 'package:wallpapers/screen/wallpaper.dart';

class MainBody extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MainBodyState();
  }
}

class MainBodyState extends State<MainBody>{

  List<String> gridViewImages= [
   'lib/images/1.jpg',
   'lib/images/2.jpg',
   'lib/images/3.jpg',
   'lib/images/5.jpg',
   'lib/images/6.jpg',
   'lib/images/7.jpg',
   'lib/images/8.jpg',
   'lib/images/9.jpg',
   'lib/images/10.jpg',
   'lib/images/11.jpg',
  //  'lib/images/.jpg',
   'lib/images/102.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: listImages(),
       
      ),
    );
  }

  listImages(){
    return Container(
      color: Colors.white, 
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
          dotIncreaseSize: 2,
          borderRadius: true,
          indicatorBgPadding: 0,
          boxFit: BoxFit.cover,
          radius: Radius.circular(10.0),
          animationCurve: Curves.easeOutSine,
          animationDuration: Duration(seconds: 5),
          images: [
            AssetImage('lib/images/1.jpg'),
            AssetImage('lib/images/3.jpg'),
            AssetImage('lib/images/9.jpg'),
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
      height: 1800,
      child: GridView.builder(itemCount: gridViewImages.length, 
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2/2.8),
      scrollDirection: Axis.vertical,
      controller: new ScrollController(keepScrollOffset: false),
      itemBuilder: (BuildContext buildContext, int index) {
        return showImages(gridViewImages[index], index,  gridViewImages);
        },
      ),
    );
  }
  showImages(showImagesList, imagesIndex, gridViewImages){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      height: 80,
      width: 80,
      child: GestureDetector(
        child: Image.asset('${showImagesList.toString()}', fit: BoxFit.cover, height: 60, width: 60,),
        onTap: (){
          Navigator.push(context, 
            MaterialPageRoute(builder: (context) =>
             DetailImages(
               heroId: imagesIndex, 
               imageUrl: showImagesList, 
               listImage: gridViewImages), 
            ),
          );
        },
      ),
    );
  }

  seeAll(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAllImages()),);
  }
}



