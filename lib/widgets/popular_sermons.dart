import 'dart:convert';

import 'package:communioncc/clients/messages.dart';
import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopularSermons extends StatefulWidget {
  @override
  _PopularSermonsState createState() => _PopularSermonsState();
}

class _PopularSermonsState extends State<PopularSermons> {
  List<Messages> _messages = List<Messages>();

  Future<List<Messages>> fetchPopularSermon() async {
    var url = "https://communioncc.org/api/v1/message/popularsermons";

    Map<String, String> headers = {
      'Accept': 'application/json',
      'Authorization':
          'Bearer base64:HgMO6FDHGziGl01OuLH9mh7CeP095shB6uuDUUClhks='
    };

    var response = await http.get(url, headers: headers);

    var messages = List<Messages>();

    if (response.statusCode == 200) {
      var messagesJson = json.decode(response.body)['data'];

      for (var messageJson in messagesJson) {
        messages.add(Messages.fromJson(messageJson));
      }
    }
    return messages;
  }

  Container mostSermon(String imageUrl, String subject, String description) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: 220.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
          children: [
            Image.network(imageUrl, fit: BoxFit.fill),
            ListTile(
              title: Text(
                subject,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: mPinkColour,
                  fontFamily: 'Montserrat',
                ),
              ),
              subtitle: Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.grey[500],
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Icon(
                      Icons.play_circle_fill_sharp,
                      color: mPinkColour,
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

  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return htmlText.replaceAll(exp, '');
  }

  @override
  void initState() {
    fetchPopularSermon().then((value) {
      setState(() {
        _messages.addAll(value);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 330.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Perform Operation to next page for message listen
              print(_messages[index].id);
            },
            child: mostSermon(
                _messages[index].imageUrl,
                _messages[index].subject,
                removeAllHtmlTags(_messages[index].description)),
          );
        },
        itemCount: _messages.length,
        shrinkWrap: true,
      ),
    );
  }
}
