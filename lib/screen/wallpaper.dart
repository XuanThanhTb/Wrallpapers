import 'package:flutter/material.dart';
import 'package:wallpapers/screen/introduce.dart';

class DetailImages extends StatefulWidget{

  final dynamic heroId, imageUrl, listImage;
  const DetailImages({Key key, this.heroId, this.imageUrl, this.listImage}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DetailImagesState();
  }
}

class DetailImagesState extends State<DetailImages> with SingleTickerProviderStateMixin{

  bool download = false;
  var progressSetting;
  bool isOpen = false;

  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animatedIcon;
  // Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  // double _fabHeight = 56.0;


  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animatedIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(
        0.00,
        1.00,
        curve: _curve,
      ),
    ));
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate(){
    if(!isOpen){
       _animationController.forward();
    }else{
       _animationController.reverse();
    }
    isOpen = !isOpen;
  }

  _introduce(){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Introduce()));
  }

  showListWallpaper(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Image.asset('${widget.imageUrl}', fit: BoxFit.cover,),
    );
  }

  showListIndexImages(BuildContext context){
    return SafeArea(
      child: Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animatedIcon,
        ),
        onPressed: animate,
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          child: Icon(Icons.arrow_back, size: 30, color: Colors.black,),
          onTap: (){
            Navigator.pop(context);
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return showListIndexImages(context);
  }
}