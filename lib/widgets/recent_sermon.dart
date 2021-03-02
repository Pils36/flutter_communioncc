import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/controllers/recentsermoncontroller.dart';
import 'package:communioncc/screens/message_destination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecentSermons extends StatelessWidget {
  final RecentSermonController recentSermonController =
      Get.put(RecentSermonController());

  Widget newSermons(String imageVal, String title, String preacher) {
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
              child: Obx(() {
                if (recentSermonController.isLoading.value == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Image.network(
                    imageVal,
                    fit: BoxFit.fill,
                  );
                }
              }),
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
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MessageDestination(
                        info: recentSermonController.messages[index],
                      )),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  newSermons(
                    recentSermonController.messages[index].imageUrl,
                    recentSermonController.messages[index].subject,
                    "Pastor Tope Awofisayo",
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
        itemCount: recentSermonController.messages.length,
        shrinkWrap: true,
      ),
    );
  }
}
