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
      width: 220.0,
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
                  fontFamily: 'Montserrat',
                ),
              ),
              subtitle: Text(
                subheading,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[500],
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Icon(
                      Icons.play_circle_fill_sharp,
                      color: mPinkColour,
                    ),
                  ),
                ],
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
      height: 330.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/c_fit,h_1500,w_1500/v1/cc_files/media_clipart/5fe3e001176c4_1608769537.jpg",
              "Rejoicing Regardless",
              "A believer must always be in alignment..."),
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/v1603818080/cc_files/media_clipart/5f985260683a2_1603818080.jpg",
              "Special Online Service",
              "A believer must always be in alignment..."),
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/v1603817696/cc_files/media_clipart/5f9850e088a97_1603817696.jpg",
              "Sunday Anniversary",
              "A believer must always be in alignment..."),
          mostSermon(
              "https://res.cloudinary.com/communioncc/image/upload/v1603817450/cc_files/media_clipart/5f984fe9d22cb_1603817449.jpg",
              "Blessed And Fruitful",
              "A believer must always be in alignment..."),
        ],
      ),
    );
  }
}
