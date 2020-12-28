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
            height: 160.0,
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
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: mPinkColour,
                  ),
                ),
                Text(
                  preacher,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Montserrat',
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
          newSermons(
              "https://res.cloudinary.com/communioncc/image/upload/v1608769537/cc_files/media_clipart/5fe3e001176c4_1608769537.png",
              "Special Thanksgiving Service",
              "Pst. Tope Awofisayo"),
          Divider(
            color: Colors.grey[400],
            height: 10.0,
            thickness: 1.0,
          ),
          newSermons(
              "https://res.cloudinary.com/communioncc/image/upload/v1607118374/cc_files/media_clipart/5fcaae265ffd7_1607118374.jpg",
              "My Church And I",
              "Pst. Tope Awofisayo"),
          Divider(
            color: Colors.grey[400],
            height: 10.0,
            thickness: 1.0,
          ),
          newSermons(
              "https://res.cloudinary.com/communioncc/image/upload/v1607117380/cc_files/media_clipart/5fcaaa439a778_1607117379.jpg",
              "Seizing The Moment",
              "Pst. Tope Awofisayo"),
          Divider(
            color: Colors.grey[400],
            height: 10.0,
            thickness: 1.0,
          ),
          newSermons(
              "https://res.cloudinary.com/communioncc/image/upload/v1599588930/cc_files/media_clipart/5f57ca416e770_1599588929.jpg",
              "I Woke Up Like This",
              "Pst. Tope Awofisayo"),
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
