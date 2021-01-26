import 'package:flutter/material.dart';

class GivingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.0, left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Giving",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
                Text(
                  "See what God can do through your generousity",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Wrap(
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/5638706/pexels-photo-5638706.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            alignment: Alignment.center,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Wrap(
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/6591166/pexels-photo-6591166.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
