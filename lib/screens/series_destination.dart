import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/models/series.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class SeriesDestination extends StatefulWidget {
  final Serie info;

  SeriesDestination({Key key, this.info}) : super(key: key);

  @override
  _SeriesDestinationState createState() => _SeriesDestinationState();
}

class _SeriesDestinationState extends State<SeriesDestination> {
  List<Serie> _messages = List<Serie>();

  Future<List<Serie>> seriesSermons() async {
    var url =
        "https://communioncc.org/api/v1/message/series/${widget.info.subject}";

    ApiClients();

    var response = await http.get(url, headers: ApiClients().headers);

    var messages = List<Serie>();

    if (response.statusCode == 200) {
      var messagesJson = json.decode(response.body)['data'];

      for (var messageJson in messagesJson) {
        messages.add(Serie.fromJson(messageJson));
      }
    }
    return messages;
  }

  @override
  void initState() {
    seriesSermons().then((value) {
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
    return Scaffold(
      body: Column(
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
          SizedBox(
            height: 5,
          ),
          Container(
            height: 400,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => print(_messages[index].subject),
                  child: Row(
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: FutureBuilder(
                            future: seriesSermons(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return Image.network(
                                  _messages[index].imageUrl,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _messages[index].subject,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w700,
                                color: mPinkColour,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "Pastor Tope Awofisayo",
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
              },
              itemCount: _messages.length,
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
