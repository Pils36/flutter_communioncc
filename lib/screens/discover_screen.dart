import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverScreen extends StatefulWidget {
  @override
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with AutomaticKeepAliveClientMixin {
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
        child: Stack(
          fit: StackFit.loose,
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Image.asset(
              "images/$imageVal",
              fit: BoxFit.fill,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black54, Colors.grey[800]],
                  begin: Alignment.topCenter,
                ),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.only(
                  bottom: 5.0,
                  left: 7.0,
                  right: 7.0,
                ),
                // minVerticalPadding: 15.0,
                title: Text(
                  heading,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange,
                    fontFamily: 'Montserrat',
                  ),
                ),
                subtitle: Text(
                  subHeading,
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
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
  Container socialMedia(
      String imageVal, String title, String urlVal, String link) {
    return Container(
      width: 300,
      padding: EdgeInsets.only(left: 15.0, top: 10.0, right: 15.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              _launchURL(link);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        fontSize: 18.0,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat',
                      ),
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      textWidthBasis: TextWidthBasis.parent,
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
          ),
          Divider(
            height: 15.0,
            color: Colors.grey.shade400,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                "Learn more about our church and how you can get involved",
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
                "Communion Outreach is about compassion, unity, selflessness, and service. We serve with more than 300 organizations. We belive in connecting with the community and would be honored if you would join us.",
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
                "Learn more about our core interest group. Career wise, Business oriented and Ministry works.",
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
                "No matter where you come from, there is a family connect for you. Join a family connect and experience real relationships that will grow your faith.",
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
                "Open your heart and see the evidence of God's presence all around you as you listen to original music written, produced and performed by C4.",
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
                "Don't see what you are looking for? Have a question? We're hapy to help.",
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
                height: 250,
                padding: EdgeInsets.only(bottom: 20.0, right: 10.0, left: 10.0),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      color: Colors.grey.shade100,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          socialMedia(
                            "assets/facebook.png",
                            " Facebook",
                            "",
                            "",
                          ),
                          socialMedia(
                            "assets/ptops.jpg",
                            " Tope Awofisayo",
                            "circled-right.png",
                            "https://www.facebook.com/tope.awofisayo",
                          ),
                          socialMedia(
                            "assets/ccc_logo.png",
                            " Communion Christ..",
                            "circled-right.png",
                            "https://www.facebook.com/communioncc",
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.grey.shade100,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          socialMedia(
                            "assets/twitter.png",
                            " Twitter",
                            "",
                            "",
                          ),
                          socialMedia(
                            "assets/cc_black.jpg",
                            " @communioncc_",
                            "circled-right.png",
                            "https://twitter.com/CommunionCC_",
                          ),
                          socialMedia(
                            "assets/ptops2.jpg",
                            " @topeawofisayo",
                            "circled-right.png",
                            "https://twitter.com/topeawofisayo",
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.grey.shade100,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          socialMedia(
                            "assets/mixlr.png",
                            " Mixlr",
                            "",
                            "",
                          ),
                          socialMedia(
                            "assets/ccc_logo.png",
                            " communioncc",
                            "circled-right.png",
                            "https://mixlr.com/communioncc",
                          ),
                          socialMedia(
                            "assets/past_tope3.jpeg",
                            " topeawofisayo",
                            "circled-right.png",
                            "https://mixlr.com/topeawofisayo",
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.grey.shade100,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          socialMedia(
                            "assets/instagram.png",
                            " Instagram",
                            "",
                            "",
                          ),
                          socialMedia(
                            "assets/ccc_logo.png",
                            " @communioncc_",
                            "circled-right.png",
                            "https://www.instagram.com/communioncc_/",
                          ),
                        ],
                      ),
                    ),
                    Card(
                      color: Colors.grey.shade100,
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          socialMedia(
                            "assets/youtube.png",
                            " Youtube",
                            "",
                            "",
                          ),
                          socialMedia(
                            "assets/ccc_logo.png",
                            " Communion Christ...",
                            "circled-right.png",
                            "https://www.youtube.com/channel/UC65SBFUV1CmwEEe5S4iYp6Q",
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

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

_launchURL(link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
