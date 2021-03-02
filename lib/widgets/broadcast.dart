import 'package:communioncc/constants/color_constant.dart';
import 'package:flutter/material.dart';

class Broadcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Watch On Demand",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35.0,
                  fontFamily: 'Roboto',
                ),
              ),
              Text(
                "Join us for worship and the sermon from this past weekend",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Image.asset(
                  'images/choir.jpeg',
                  fit: BoxFit.contain,
                  width: MediaQuery.of(context).size.width,
                ),
                elevation: 0,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Schedule",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Sundays",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "Sunday Experience",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  color: mOrangeColour,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "7:30AM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Upgrade Service with Core Interest Groups",
                            style: TextStyle(),
                          ),
                          Divider(
                            height: 20.0,
                          ),
                          Text(
                            "9:00AM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Sunday Morning Experience",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Wednesdays",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "Mid-week Service",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  color: mOrangeColour,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "6:00PM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Communion Midweek Service",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "Fridays",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
              ),
              Text(
                "Fasting and Prayers",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 16.0,
                  fontFamily: 'Roboto',
                  color: mOrangeColour,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "12:00AM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Prayer Watch for 10mins or more",
                            style: TextStyle(),
                          ),
                          Divider(
                            height: 20.0,
                          ),
                          Text(
                            "6:00AM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Prayer Session with Pastor",
                            style: TextStyle(),
                          ),
                          Divider(
                            height: 20.0,
                          ),
                          Text(
                            "1:00PM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Prayer Session with Pastor",
                            style: TextStyle(),
                          ),
                          Divider(
                            height: 20.0,
                          ),
                          Text(
                            "5:30PM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Prayer Session with Pastor",
                            style: TextStyle(),
                          ),
                          Divider(
                            height: 20.0,
                          ),
                          Text(
                            "11:59PM",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Prayer Session with Pastor",
                            style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
