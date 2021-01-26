import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Locations",
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w900,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                        Image.network(
                          "https://img.icons8.com/pastel-glyph/64/000000/search--v2.png",
                          width: 40.0,
                          height: 40.0,
                        )
                      ],
                    ),
                    Divider(
                      height: 50.0,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
