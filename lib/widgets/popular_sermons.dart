import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/models/messages.dart';
import 'package:communioncc/screens/message_destination.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class PopularSermons extends StatefulWidget {
  @override
  _PopularSermonsState createState() => _PopularSermonsState();
}

class _PopularSermonsState extends State<PopularSermons> {
  List<Messages> _messages = List<Messages>();

  Future<List<Messages>> fetchPopularSermon() async {
    var url = "https://communioncc.org/api/v1/message/popularsermons";

    ApiClients();

    var response = await http.get(url, headers: ApiClients().headers);

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
      width: 240.0,
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Wrap(
          children: [
            FutureBuilder(
              future: fetchPopularSermon(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Image.network(
                    imageUrl,
                    fit: BoxFit.fill,
                    width: 240,
                    height: 200,
                  );
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              },
            ),
            ListTile(
              title: Text(
                subject,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                  color: Colors.red.shade800,
                  fontFamily: 'Montserrat',
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                description,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                  fontFamily: 'Roboto',
                ),
                overflow: TextOverflow.ellipsis,
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
      if (mounted) {
        setState(() {
          _messages.addAll(value);
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 270.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MessageDestination(
                        info: _messages[index],
                      )),
            ),
            child: mostSermon(
              _messages[index].imageUrl,
              _messages[index].subject,
              removeAllHtmlTags(_messages[index].description),
            ),
          );
        },
        itemCount: _messages.length,
        shrinkWrap: true,
      ),
    );
  }
}
