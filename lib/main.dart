import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Montserrat",
        scaffoldBackgroundColor: Colors.white,
        primaryColor: mOrangeColour,
      ),
      // darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}
