import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
// Discover Information Module
  Container discoverInfo(String imageVal, String heading, String subHeading) {
    return Container(
      width: MediaQuery.of(context).size.width - 100.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
          children: [
            Image.asset(
              "images/$imageVal",
              fit: BoxFit.fill,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(
                bottom: 10.0,
                left: 10.0,
                right: 10.0,
              ),
              // minVerticalPadding: 15.0,
              title: Text(
                heading,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w600,
                  color: mOrangeColour,
                  fontFamily: 'Montserrat',
                ),
              ),
              subtitle: Text(
                subHeading,
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'Montserrat',
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
      ),
    );
  }

// Social media module
  Container socialMedia(String imageVal, String title, String urlVal) {
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
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(imageVal),
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Montserrat',
                        ),
                        textAlign: TextAlign.center,
                        textWidthBasis: TextWidthBasis.longestLine,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                verticalDirection: VerticalDirection.up,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    urlVal != '' ? "images/$urlVal" : "images/white.png",
                    width: 25.0,
                    height: 25.0,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 20.0,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            physics: ClampingScrollPhysics(),
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Discover more from Communion CC",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat',
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              discoverInfo(
                'newhere.jpg',
                "New Here?",
                "\nLearn more about our church and how you can get involved",
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
              discoverInfo(
                'outreach.jpg',
                "Communion Outreach",
                "\nCommunion Outreach is about compassion, unity, selflessness, and service. We serve with more than 300 organizations. We belive in connecting with the community abd would be honored if you would join us.",
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "FIND EVENTS",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              discoverInfo(
                "coreinterest.jpg",
                "Core Interest Group",
                "\nLearn more about our core interest group. Career wise, Business oriented and Ministry works.",
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "JOIN A TEAM",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              discoverInfo(
                "familyconnect.jpg",
                "Family Connect",
                "\nNo matter where you come from, there is a family connect for you. Join a family connect and experience real relationships that will grow your faith.",
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "JOIN A UNIT",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              discoverInfo(
                "choir.jpeg",
                "Communion Choir",
                "\nOpen your heart and see the evidence of God's presence all around you as you listen to original music written, produced and performed by C4.",
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "LEARN MORE",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              discoverInfo(
                "contact.jpg",
                "Need more info?",
                "\nDon't see what you are looking for? Have a question? We're hapy to help.",
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "CONTACT US",
                  style: TextStyle(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Text(
                  "Social Media",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20.0, right: 10.0, left: 10.0),
                child: Wrap(
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          socialMedia(
                            "assets/facebook.png",
                            " Facebook",
                            "",
                          ),
                          socialMedia(
                            "assets/ptops.jpg",
                            " Tope Awofisayo",
                            "circled-right.png",
                          ),
                          socialMedia(
                            "assets/ccc_logo.png",
                            " communioncc",
                            "circled-right.png",
                          ),
                          socialMedia(
                            "assets/twitter.png",
                            " Twitter",
                            "",
                          ),
                          socialMedia(
                            "assets/cc_black.jpg",
                            " communioncc_",
                            "circled-right.png",
                          ),
                          socialMedia(
                            "assets/ptops2.jpg",
                            " topeawofisayo",
                            "circled-right.png",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
