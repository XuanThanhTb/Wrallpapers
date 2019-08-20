import 'package:flutter/material.dart';
import 'package:wallpapers/screen/introduce.dart';

class DetailImages extends StatefulWidget{
 

  final dynamic heroId, imageUrl;
  // final ThemeData themeData;
  const DetailImages({Key key, this.heroId, this.imageUrl,}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return DetailImagesState();
  }
}

class DetailImagesState extends State<DetailImages>{
 bool download = false;
 var progressSetting;

  _introduce(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Introduce()));
  }

  showListWallpaper(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset('${widget.imageUrl}', fit: BoxFit.cover,),
        ],
      )
    );
  }

  showListIndexImages(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, size: 30, color: Colors.black,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        title: Row(

          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text('Wallpapers', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black)),),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 10),
                child: Image.asset('lib/images/vertical.png', color: Colors.black, fit: BoxFit.cover, height: 20,),
              ),
              onTap: (){
               _introduce();
              },
            )
          ],
        ),
      ),
      body: showListWallpaper(),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return showListIndexImages(context);
  }
}


  