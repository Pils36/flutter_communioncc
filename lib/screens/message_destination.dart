import 'package:communioncc/components/sermon_modal.dart';
import 'package:communioncc/components/share_button.dart';
import 'package:communioncc/components/subscribe_redirect.dart';
import 'package:communioncc/models/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class MessageDestination extends StatefulWidget {
  final Messages info;

  MessageDestination({Key key, this.info}) : super(key: key);

  @override
  _MessageDestinationState createState() => _MessageDestinationState();
}

class _MessageDestinationState extends State<MessageDestination> {
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    String datetime = widget.info.createdAt;

    DateTime now = DateTime.parse(datetime);

    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("${widget.info.subject}"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0.0, 2.0),
                          blurRadius: 6.0,
                        ),
                      ]),
                  child: Hero(
                    tag: widget.info.id,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image(
                          image: NetworkImage(widget.info.imageUrl),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.info.subject,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Montserrat',
                      color: Colors.orange.shade900,
                    ),
                  ),
                  Divider(),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    removeAllHtmlTags(widget.info.description)
                        .replaceAll('&nbsp;', ' '),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "${DateFormat.yMMMd().format(now)}",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade900,
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubscribeRedirect(),
                        Theme(
                          data: Theme.of(context)
                              .copyWith(canvasColor: Colors.transparent),
                          child: SermonModal(
                            info: widget.info,
                          ),
                        ),
                        ShareButton(
                          info: widget.info,
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
