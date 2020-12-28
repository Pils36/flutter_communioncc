import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';

class RecentSermons extends StatefulWidget {
  @override
  _RecentSermonsState createState() => _RecentSermonsState();
}

class _RecentSermonsState extends State<RecentSermons> {
  Container newSermons(String imageVal, String title, String preacher) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Container(
            width: 160.0,
            height: 90.0,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.network(
                imageVal,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: mPinkColour,
                  ),
                ),
                Text(
                  preacher,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          newSermons("https://placeimg.com/600/420/any",
              "The Foundation For Favour", "Holly Furtick"),
          Divider(
            color: Colors.grey[400],
            height: 10.0,
            thickness: 1.0,
          ),
          newSermons("https://placeimg.com/600/420/any", "Favor Over Fear",
              "Steven Furtick"),
          Divider(
            color: Colors.grey[400],
            height: 10.0,
            thickness: 1.0,
          ),
          newSermons("https://placeimg.com/600/420/any", "Finish With Favor",
              "Steven Furtick"),
          Divider(
            color: Colors.grey[400],
            height: 10.0,
            thickness: 1.0,
          ),
          newSermons("https://placeimg.com/600/420/any", "I Woke Up Like This",
              "Levi Lusko"),
          Divider(
            color: Colors.grey[400],
            height: 10.0,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}
