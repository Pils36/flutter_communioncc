// import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/controllers/allsermoncontroller.dart';
import 'package:communioncc/screens/message_destination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoreSermon extends StatelessWidget {
  final AllSermonController recentSermonController =
      Get.put(AllSermonController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Obx(() => Text(
              "Over ${recentSermonController.messages.length} messages available",
              style: TextStyle(
                fontFamily: "ROboto",
              ),
            )),
      ),
      body: Obx(() => ListView.builder(
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
                        color: Colors.grey[200],
                        height: 1.0,
                        thickness: 1.0,
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: recentSermonController.messages.length,
          )),
    );
  }

  newSermons(String imageUrl, String subject, String preacher) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
              child: Obx(() {
                if (recentSermonController.isLoading.value == true) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Image.network(
                    imageUrl,
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
                  subject,
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
}
