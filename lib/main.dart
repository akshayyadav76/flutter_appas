import 'package:flutter/material.dart';

import 'custom_icon.dart';
import './data.dart';
import 'dart:math';

main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

var cardAspectRation = 12.0 / 16.0;
var widegetAspectRation = cardAspectRation * 1.2;

class _HomeState extends State<Home> {
  var CurrentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        CurrentPage = controller.page;
      });
    });

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
              child: Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 22.0, vertical: 6.0),
                        child: Text(
                          "Animated",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "30+ Stories",
                    style: TextStyle(color: Colors.white),
                  ),
                  Stack(
                    children: <Widget>[
                      CardScrollWidget(CurrentPage),
                      Positioned.fill(
                          child: PageView.builder(
                              itemCount: images.length,
                              controller: controller,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return Container();
                              }))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentpage;
  var padding = 20.0;
  var verticalInsert = 20.0;

  CardScrollWidget(this.currentpage);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widegetAspectRation,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidget = width - 2 * padding;
        var safeheight = height - 2 * padding;

        var heightOfPrimaryCard = safeheight;
        var widthtOfPrimaryCard = heightOfPrimaryCard * cardAspectRation;

        var primaryCardLeft = safeWidget - widthtOfPrimaryCard;
        var horizontalInsert = primaryCardLeft / 2;


        List<Widget>cardList =List();
        for (var i = 0; i < images.length; i++) {
          var delete = i - currentpage;
          bool isOnRight = delete > 0;
          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInsert * -delete * (isOnRight ? 15 : 1),
                  0.0);
          var cardItem = Positioned.directional(
            top: padding + verticalInsert * max(-delete, 0.0),
            bottom: padding + verticalInsert * max(-delete, 0.0),
            start: padding + start,
            textDirection: TextDirection.rtl,
            child: Container(
              child: AspectRatio(aspectRatio: cardAspectRation,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(images[i],fit: BoxFit.cover,)
                ],
              ),),
              
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}
