import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/constants/style_constant.dart';
import 'package:communioncc/widgets/popular_sermons.dart';
import 'package:communioncc/widgets/recent_sermon.dart';
import 'package:communioncc/widgets/series.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black, //or set color with: Color(0xFF0000FF)
    ));

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mBackgroundColour,
          elevation: 0,
          title: TabBar(
            labelColor: Colors.orange.shade900,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.black26,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sermons"),
                    Icon(
                      Icons.mic,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Broadcast"),
                    Icon(
                      Icons.videocam,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Setting up background color
        backgroundColor: mBackgroundColour,
        body: TabBarView(
          children: [
            Container(
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  // Start Search Field
                  Container(
                    margin: EdgeInsets.only(left: 10.0, right: 5.0),
                    padding: EdgeInsets.only(left: 10.0, right: 5.0),
                    child: TextField(
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 17.0,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: mGreyColour,
                        ),
                        hintText: 'Search',
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey[200],
                    ),
                  ),

                  // End Search Field

                  // Start Home Card Section
                  Container(
                    // height: 350.0,
                    width: MediaQuery.of(context).size.width - 100.0,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.network(
                        'https://res.cloudinary.com/communioncc/image/upload/v1603818080/cc_files/media_clipart/5f985260683a2_1603818080.jpg',
                        fit: BoxFit.fill,
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                  ),

                  // Popular Sermons
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      'Popular Sermons',
                      style: mTitleStyle,
                    ),
                  ),

                  PopularSermons(),

                  // Series
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5),
                    child: Text(
                      'Series',
                      style: mTitleStyle,
                    ),
                  ),

                  Series(),

                  // Recent Sermons
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 5, bottom: 10.0),
                    child: Text(
                      'Recent Sermons',
                      style: mTitleStyle,
                    ),
                  ),

                  RecentSermons(),

                  SizedBox(
                    height: 10.0,
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    margin:
                        EdgeInsets.only(left: 30.0, right: 40.0, bottom: 30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "VIEW MORE SERMONS",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // End Home Card Section
                ],
              ),
            ),
            Container(
              child: Center(
                child: Text("Broadcast Page"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
