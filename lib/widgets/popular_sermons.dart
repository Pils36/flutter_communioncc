import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';

class PopularSermons extends StatefulWidget {
  @override
  _PopularSermonsState createState() => _PopularSermonsState();
}

class _PopularSermonsState extends State<PopularSermons> {
  Container mostSermon(String imageVal, String heading, String subheading) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: 250.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
          children: [
            Image.network(imageVal, fit: BoxFit.fill),
            ListTile(
              title: Text(
                heading,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: mPinkColour,
                  fontFamily: 'Roboto',
                ),
              ),
              subtitle: Text(
                subheading,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[500],
                  fontFamily: 'Roboto',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 240.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          mostSermon(
              "https://placeimg.com/600/420/any", "Heading 1", "Sub Heading 1"),
          mostSermon(
              "https://placeimg.com/600/420/any", "Heading 2", "Sub Heading 2"),
          mostSermon(
              "https://placeimg.com/600/420/any", "Heading 3", "Sub Heading 3"),
          mostSermon(
              "https://placeimg.com/600/420/any", "Heading 4", "Sub Heading 4"),
        ],
      ),
    );
  }
}
