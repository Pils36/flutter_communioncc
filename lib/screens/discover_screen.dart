import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    "Discover more from Communion CC",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100.0,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Wrap(
                  children: [
                    Image.network(
                      'https://livingwellaware.com/wp-content/uploads/2020/03/Happy.jpg',
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      minVerticalPadding: 15.0,
                      title: Text(
                        "New Here?",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\n Learn more about our church and how you can get involved",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: Text(
                "GET STARTED",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 100.0,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Wrap(
                  children: [
                    Image.network(
                      'https://res.cloudinary.com/communioncc/image/upload/c_fit,h_1500,w_1500/v1/cc_files/media_clipart/5fe3e001176c4_1608769537.jpg',
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      minVerticalPadding: 15.0,
                      title: Text(
                        "Get Started",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\n At CommunionCC, we help you discover and fulfil your God-given purpose or vision in life. We are called to fulfil our destinies and to help others fulfil their destinies in Christ",
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
