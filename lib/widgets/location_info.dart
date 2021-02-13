import 'package:flutter/material.dart';

class ChurchCentres extends StatefulWidget {
  @override
  _ChurchCentresState createState() => _ChurchCentresState();
}

class _ChurchCentresState extends State<ChurchCentres> {
  Container newLocation(
      String imageVal, String title, String subtitle, String miles) {
    return Container(
      // color: Colors.grey[200],
      padding: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
      child: Wrap(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Wrap(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        imageVal,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0, left: 5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w300,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(miles),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  )
                ],
              ),
            ],
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
          newLocation("assets/presken.JPG", "Lagos Church",
              "Presken Hotel, Eden Place", "341mi"),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Divider(
              color: Colors.grey[400],
              height: 20.0,
              thickness: 1.0,
            ),
          ),
          newLocation(
              "assets/OAU.jpg", "Ife Church", "Ife, Osun State", "1099mi"),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Divider(
              color: Colors.grey[400],
              height: 20.0,
              thickness: 1.0,
            ),
          ),
          newLocation("assets/ibadan.jpg", "Ibadan Church", "Ibadan, Oyo State",
              "846mi"),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Divider(
              color: Colors.grey[400],
              height: 20.0,
              thickness: 1.0,
            ),
          ),
          newLocation("assets/moro.jpeg", "Campus Fellowship",
              "Moro, Osun State", "1123mi"),
          Padding(
            padding: const EdgeInsets.only(
              left: 10.0,
              right: 20.0,
              bottom: 20.0,
            ),
            child: Divider(
              color: Colors.grey[400],
              height: 20.0,
              thickness: 1.0,
            ),
          ),
        ],
      ),
    );
  }
}
