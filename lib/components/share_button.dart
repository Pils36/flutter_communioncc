import 'package:communioncc/models/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

class ShareButton extends StatelessWidget {
  final Messages info;

  ShareButton({Key key, this.info}) : super(key: key);

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        share(info.messageUrl, info.subject, info.description);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              'assets/share.png',
              width: 35,
              height: 35,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text("Share",
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

// Create a method that shares to media platforms

Future<void> share(dynamic link, String subject, String description) async {
  await FlutterShare.share(
    title: subject,
    text: "$subject - Listen smartly!",
    linkUrl: link,
    chooserTitle: subject,
  );
}
