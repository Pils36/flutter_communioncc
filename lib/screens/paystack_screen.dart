import 'package:flutter/material.dart';

class PaystackPage extends StatefulWidget {
  @override
  _PaystackPageState createState() => _PaystackPageState();
}

class _PaystackPageState extends State<PaystackPage> {
  String _name;

  String _email;

  String _purpose;

  int _amount;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Give to the Lord"),
        ),
      ),
    );
  }
}
