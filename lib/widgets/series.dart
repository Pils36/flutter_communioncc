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
      height: 150.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          mostSermon("https://placeimg.com/600/420/any"),
          mostSermon("https://placeimg.com/600/420/any"),
          mostSermon("https://placeimg.com/600/420/any"),
          mostSermon("https://placeimg.com/600/420/any"),
        ],
      ),
    );
  }
}
