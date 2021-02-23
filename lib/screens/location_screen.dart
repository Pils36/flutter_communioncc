import 'package:communioncc/widgets/location_info.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Image.asset(
                      "assets/search.png",
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
          ),
          ChurchCentres(),
        ],
      ),
    );
  }
}
