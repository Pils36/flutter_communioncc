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
            Image.network(
              imageVal,
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
                  color: mPinkColour,
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
                        backgroundImage: NetworkImage(imageVal),
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
                  Image.network(
                    urlVal,
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
    return Scaffold(
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.0, left: 10.0),
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
            discoverInfo(
              'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1084793354%2F960x0.jpg%3Ffit%3Dscale',
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
              'https://eu.aimint.org/wp-content/uploads/2015/05/outreachAndEvangelism.jpg',
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
              "https://www.dekhnews.com/wp-content/uploads/2020/08/In-Conclusion.jpg",
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
              "https://i2.wp.com/thevoiceofblackcincinnati.com/wp-content/uploads/2020/02/237582946_Family-on-Couch_1024-scaled.jpg?fit=2560%2C1467&ssl=1",
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
              "https://images.pexels.com/photos/2014773/pexels-photo-2014773.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
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
              "https://images.pexels.com/photos/7101/wood-coffee-iphone-notebook.jpg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
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
                          "https://img.icons8.com/color/48/000000/facebook.png",
                          " Facebook",
                          "",
                        ),
                        socialMedia(
                          "https://scontent-los2-1.xx.fbcdn.net/v/t1.0-9/128804031_10224341145620347_2364892448218258573_n.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=-nB2uWyocaAAX-5y9EI&_nc_ht=scontent-los2-1.xx&oh=f20b89c70e4bf0324a906f8a34e7a26a&oe=6033003F",
                          " Tope Awofisayo",
                          "https://img.icons8.com/pastel-glyph/64/000000/circled-right.png",
                        ),
                        socialMedia(
                          "https://communioncc.org/img/cc_image/ccc_logo.png",
                          " communioncc",
                          "https://img.icons8.com/pastel-glyph/64/000000/circled-right.png",
                        ),
                        socialMedia(
                          "https://img.icons8.com/fluent/48/000000/twitter.png",
                          " Twitter",
                          "",
                        ),
                        socialMedia(
                          "https://pbs.twimg.com/profile_images/997080325137281024/DLw3jWU9_400x400.jpg",
                          " communioncc_",
                          "https://img.icons8.com/pastel-glyph/64/000000/circled-right.png",
                        ),
                        socialMedia(
                          "https://pbs.twimg.com/profile_images/938800144014704640/F3PlyC8O_400x400.jpg",
                          " topeawofisayo",
                          "https://img.icons8.com/pastel-glyph/64/000000/circled-right.png",
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
    );
  }
}
