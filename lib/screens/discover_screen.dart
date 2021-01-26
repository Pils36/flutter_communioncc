import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
// Social media module
  Container socialMedia(String imageVal, String title) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
      child: Wrap(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Image.network(
              //       "https://img.icons8.com/ios/24/000000/circled-right-2.png",
              //       height: 20.0,
              //       width: 20.0,
              //     )
              //   ],
              // ),
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
                      'https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fdam%2Fimageserve%2F1084793354%2F960x0.jpg%3Ffit%3Dscale',
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
                        "New Here?",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\nLearn more about our church and how you can get involved",
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
                      'https://eu.aimint.org/wp-content/uploads/2015/05/outreachAndEvangelism.jpg',
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      // minVerticalPadding: 15.0,
                      contentPadding: EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      title: Text(
                        "Communion Outreach",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\nCommunion Outreach is about compassion, unity, selflessness, and service. We serve with more than 300 organizations. We belive in connecting with the community abd would be honored if you would join us.",
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
                      'https://www.dekhnews.com/wp-content/uploads/2020/08/In-Conclusion.jpg',
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      // minVerticalPadding: 15.0,
                      contentPadding: EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      title: Text(
                        "Core Interest Group",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\nLearn more about our core interest group. Career wise, Business oriented and Ministry works.",
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
                      'https://i2.wp.com/thevoiceofblackcincinnati.com/wp-content/uploads/2020/02/237582946_Family-on-Couch_1024-scaled.jpg?fit=2560%2C1467&ssl=1',
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      // minVerticalPadding: 15.0,
                      contentPadding: EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      title: Text(
                        "Family Connect",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w900,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\nNo matter where you come from, there is a family connect for you. Join a family connect and experience real relationships that will grow your faith.",
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
                      'https://i.ytimg.com/vi/D8J6pHHGqxU/maxresdefault.jpg',
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      // minVerticalPadding: 15.0,
                      contentPadding: EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      title: Text(
                        "Communion Choir",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\nOpen your heart and see the evidence of God's presence all around you as you listen to original music written, produced and performed by C4",
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
                      'https://www.macworld.co.uk/cmsdata/features/3689410/change_user_name_mac_thumb1200_4-3.jpg',
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      // minVerticalPadding: 15.0,
                      contentPadding: EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      title: Text(
                        "Need more info?",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600,
                          color: mPinkColour,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      subtitle: Text(
                        "\nDon't see what you are looking for? Have a question? We're hapy to help.",
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
              child: Card(
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
                    ),
                    socialMedia(
                      "https://scontent-los2-1.xx.fbcdn.net/v/t1.0-9/128804031_10224341145620347_2364892448218258573_n.jpg?_nc_cat=105&ccb=2&_nc_sid=09cbfe&_nc_ohc=-nB2uWyocaAAX-5y9EI&_nc_ht=scontent-los2-1.xx&oh=f20b89c70e4bf0324a906f8a34e7a26a&oe=6033003F",
                      " Tope Awofisayo",
                    ),
                    socialMedia(
                      "https://communioncc.org/img/cc_image/ccc_logo.png",
                      " communioncc",
                    ),
                    socialMedia(
                      "https://img.icons8.com/fluent/48/000000/twitter.png",
                      " Twitter",
                    ),
                    socialMedia(
                      "https://pbs.twimg.com/profile_images/997080325137281024/DLw3jWU9_400x400.jpg",
                      " communioncc_",
                    ),
                    socialMedia(
                      "https://pbs.twimg.com/profile_images/938800144014704640/F3PlyC8O_400x400.jpg",
                      " topeawofisayo",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
