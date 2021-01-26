import 'package:communioncc/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light(),
      // darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}
