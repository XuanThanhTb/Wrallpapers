import 'package:flutter/material.dart';
import 'package:wallpapers/screen/category.dart';
import 'package:wallpapers/screen/mainhome.dart';
import 'package:wallpapers/screen/settings.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}
class _HomeState extends State<Home>{
  var pageIndex = 0;
  PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4),
              child: Icon(Icons.access_time, color: Colors.black,),
            ),
            Text('Wallpapers', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black)),
          ],
        ),
        //  backgroundColor: state.themeData.primaryColor
      ),
      body: Container(
        color: Colors.white,
        child: PageView(
          physics: BouncingScrollPhysics(),
          controller: pageController,
          onPageChanged: onPageChanged,
          children: <Widget>[
            MainBody(),
            Category(),
            SettingsPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black,
        elevation: 10,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(fontSize: 14, color: Colors.black,)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category', style: TextStyle(fontSize: 14, color: Colors.black,))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(fontSize: 14, color: Colors.black,))
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
   onPageChanged(int value){
   setState(() {
    pageIndex = value; 
   });
 }

 navigationTapped(int value){
   pageController.animateToPage(value,
    duration: const Duration(milliseconds: 300), curve: Curves.ease);
 }
}