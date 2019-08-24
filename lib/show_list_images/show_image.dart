import 'package:flutter/material.dart';
import 'package:residemenu/residemenu.dart';
import 'package:wallpapers/screen/category.dart';
import 'package:wallpapers/screen/main_home.dart';
import 'package:wallpapers/screen/settings.dart';

class HomeShowImages extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeShowImagesState();
  }
}

class HomeShowImagesState extends State<HomeShowImages> with TickerProviderStateMixin{
  MenuController menuController;
  var pageIndex = 0;
  PageController pageController = PageController();

  @override 
    void initState() {
    super.initState();
    menuController = MenuController(vsync: this);
  }

  @override
  void dispose(){
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var  check =  pageIndex % 2 == 0 ? Colors.amber : Colors.black;
    return ResideMenu.scaffold(
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage('lib/images/6.jpg'),
        fit: BoxFit.cover),
      ),
      controller: menuController,
      leftScaffold: MenuScaffold(
        header: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 80, maxWidth: 100),
            child: CircleAvatar(
             backgroundImage: AssetImage('lib/images/6.jpg'),
             radius: 30,
            ),
        ),
        children: <Widget>[
          Material(
            color: Colors.transparent,
              child: new InkWell(
                child: ResideMenuItem(
                  title: 'Share the App',
                  titleStyle: TextStyle(color: Colors.black),
                  icon: const Icon(Icons.share, color: Colors.black),
                ),
                onTap: (){
                }
              ),
          ),
           Material(
            color: Colors.transparent,
            child: new InkWell(
              child: ResideMenuItem(
                title: 'Suggestions',
                titleStyle: TextStyle(color: Colors.black),
                icon: const Icon(Icons.bug_report, color: Colors.black),
              ),
              onTap: (){
              }
            ),
          ),
        ],
      ),
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 5,
        leading: GestureDetector(
          child: Icon(Icons.menu, color: Colors.black,),
          onTap: (){
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text('Wallpapers', textAlign: TextAlign.center, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.black)),
            ),
          ],
        ),
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
        showSelectedLabels: true,
        showUnselectedLabels: false,
        elevation: 10,
        currentIndex: pageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(fontSize: 14, color: check,)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Category', style: TextStyle(fontSize: 14, color: Colors.amber,))
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(fontSize: 14, color: check,))
          ),
        ],
        onTap: navigationTapped,
       ),
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
    duration: const Duration(milliseconds: 200), curve: Curves.ease);
 }
}