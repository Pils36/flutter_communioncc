import 'dart:convert';

import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/models/series.dart';
import 'package:communioncc/screens/series_destination.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class Series extends StatefulWidget {
  @override
  _SeriesState createState() => _SeriesState();
}

class _SeriesState extends State<Series> {
// Get series message here and populate
  List<Serie> _messages = List<Serie>();

  Future<List<Serie>> seriesSermon() async {
    var url = "https://communioncc.org/api/v1/message/series";

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

  Container mostSermon(String imageVal) {
    return Container(
      width: 250.0,
      padding: EdgeInsets.only(left: 10.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: FutureBuilder(
          future: seriesSermon(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Image.network(
                imageVal,
                fit: BoxFit.fill,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    seriesSermon().then((value) {
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
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => SeriesDestination(
                          info: _messages[index],
                        )),
              );
            },
            child: Hero(
              tag: _messages[index].subject,
              child: mostSermon(
                _messages[index].imageUrl,
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
