import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SubscribeRedirect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchURL("https://www.youtube.com/channel/UC65SBFUV1CmwEEe5S4iYp6Q");
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              "assets/notify.png",
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text("Subscribe",
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              )),
        ],
      ),
    );
  }
}

_launchURL(link) async {
  var url = link;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
