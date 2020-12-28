import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';

class Series extends StatefulWidget {
  @override
  _SeriesState createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
  Container mostSermon(String imageVal) {
    return Container(
      width: 250.0,
      padding: EdgeInsets.only(left: 10.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Image.network(imageVal, fit: BoxFit.fill),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/v1600801640/cc_files/media_clipart/5f6a4b67a3bec_1600801639.jpg"),
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/v1608284702/cc_files/media_clipart/5fdc7a1e28c3a_1608284702.jpg"),
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/v1608285265/cc_files/media_clipart/5fdc7c518d2de_1608285265.jpg"),
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/v1608285702/cc_files/media_clipart/5fdc7e0600fe4_1608285702.jpg"),
        ],
      ),
    );
  }
}
