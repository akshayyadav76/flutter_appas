import 'package:flutter/material.dart';

import 'custom_icon.dart';

main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2d3447),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 30.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Tranding",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36.0,
                      fontFamily: "Calibre-Semibold",
                      letterSpacing: 1.0,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 12.0,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child:
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20.0),
                  ),child: Center(
                  child: Padding(padding: EdgeInsets.symmetric(horizontal: 22.0,vertical: 6.0),
                  child: Text("Animated",style: TextStyle(color: Colors.white),),),
                  
                ),
                ),
                SizedBox(width: 10.0,),
                Text("30+ Stories",style: TextStyle(color: Colors.white),),
              ],
            ),),
          ],
        ),
      ),
    );
  }
}
