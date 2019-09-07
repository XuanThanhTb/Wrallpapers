import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SettingsPageState();
  }
}
class SettingsPageState extends State<SettingsPage>{

  final List<Color> colors = [Colors.white, Colors.black, Color(0xff323639)];
  final List<Color> borders = [Colors.black, Colors.white, Colors.white];
  final List<String> themes = ['Light', 'Amoled', 'Dark'];

  @override
  void initState(){
    super.initState();
  }

  _themelight(){
      showDialog(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Text('Change Theme', style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
          content: SizedBox(
            height: 100,
            child: Center(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index){
                  return Stack(
                    children: <Widget>[
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape:
                                BoxShape.circle,
                                  border: Border.all(
                                  width: 2,
                                  color: borders[index]),
                              color: colors[index]),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset('lib/images/theme.png', fit: BoxFit.cover, height: 30, width: 30,),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Text('Theme', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                 Padding(
                  padding: EdgeInsets.only(),
                  child: Image.asset('lib/images/circle.png', fit: BoxFit.cover, height: 30, width: 30),
                ),
              ],
            ),
            onTap: (){
                _themelight();
            },
          )
        ],
      ),
    );
  }
}