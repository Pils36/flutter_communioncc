import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/ccc_logo.png",
                fit: BoxFit.cover,
                width: 180,

              ),
              SizedBox(height: 7),
              Text("Raising fulfilled generation...", style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,

              )),
            ],
          ),
        ),
      ),
    );
  }
}
