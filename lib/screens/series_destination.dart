import 'package:communioncc/models/series.dart';
import 'package:flutter/material.dart';

class SeriesDestination extends StatefulWidget {
  final Serie info;

  SeriesDestination({Key key, this.info}) : super(key: key);

  @override
  _SeriesDestinationState createState() => _SeriesDestinationState();
}

class _SeriesDestinationState extends State<SeriesDestination> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(widget.info.subject),
        ),
      ),
    );
  }
}
