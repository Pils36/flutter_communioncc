import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/constants/style_constant.dart';
import 'package:communioncc/widgets/popular_sermons.dart';
import 'package:communioncc/widgets/recent_sermon.dart';
import 'package:communioncc/widgets/series.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up background color
      backgroundColor: mBackgroundColour,
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            // Tab section
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20.0,
                    margin: EdgeInsets.only(top: 15.0, left: 20.0),
                    child: Text(
                      'Sermons',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                  Container(
                    height: 20.0,
                    margin: EdgeInsets.only(top: 15.0, right: 20.0),
                    child: Text(
                      'Broadcasts',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 15.0,
            ),

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
              margin: EdgeInsets.only(left: 10.0, right: 5.0, bottom: 30.0),
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
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0,
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
    );
  }
}
