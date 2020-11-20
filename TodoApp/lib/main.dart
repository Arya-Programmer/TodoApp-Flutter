import 'package:flutter/material.dart';

import './UI/Intray/intray_page.dart';
import './UI/Intray/Movable.dart';
import './models/global.dart' as Styles;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ToDo",
      color: Colors.pink,
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Stack(
              children: <Widget>[
                TabBarView(
                children: [
                  IntrayPage(),
                  Container(
                    color: Styles.darkGreyColor,
                  ),
                  MoveableStackItem(),
                ],
              ),
                Container(
                  padding: EdgeInsets.only(left:50),
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Intray", style: Styles.intrayTitleStyle),
                      Container(

                      ),
                    ]
                  ),
                ),
                Container(
                  height: 80,
                  width: 80,
                  margin: EdgeInsets.only(top: 110, left: MediaQuery.of(context).size.width*0.5 - 40),
                  child: FloatingActionButton(
                    child: Icon(Icons.add, size: 70,),
                    backgroundColor: Styles.blueColor,
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            appBar: AppBar(
              elevation: 0,
              title: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.calendar_today_outlined, size: 35),
                  ),
                  Tab(
                    icon: Icon(Icons.add, size: 40),
                  ),
                  Tab(
                    icon: Icon(Icons.menu, size: 35),
                  ),
                ],
                labelColor: Styles.blueColor,
                unselectedLabelColor: Styles.darkGreyColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.transparent,
              ),
              backgroundColor: Colors.white
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
