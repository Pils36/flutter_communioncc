import 'dart:convert';

import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/models/messages.dart';
import 'package:communioncc/screens/message_destination.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RecentSermons extends StatefulWidget {
  @override
  _RecentSermonsState createState() => _RecentSermonsState();
}

class _RecentSermonsState extends State<RecentSermons> {
  List<Messages> _messages = List<Messages>();

  Future<List<Messages>> recentSermons() async {
    var url = "https://communioncc.org/api/v1/message/recentsermons";

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

  Container newSermons(String imageVal, String title, String preacher) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      child: Row(
        children: [
          Container(
            width: 160.0,
            height: 160.0,
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: FutureBuilder(
                future: recentSermons(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      imageVal,
                      fit: BoxFit.fill,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w700,
                    color: mPinkColour,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  preacher,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    recentSermons().then((value) {
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
      height: 400,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MessageDestination(
                        info: _messages[index],
                      )),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  newSermons(
                    _messages[index].imageUrl,
                    _messages[index].subject,
                    "Pst. Tope Awofisayo",
                  ),
                  Divider(
                    color: Colors.grey[400],
                    height: 10.0,
                    thickness: 1.0,
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: _messages.length,
        shrinkWrap: true,
      ),
    );
  }
}
