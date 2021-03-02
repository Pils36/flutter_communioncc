import 'package:communioncc/controllers/sermoncontroller.dart';
import 'package:communioncc/htmlparam/remove_all_tags.dart';
import 'package:communioncc/screens/message_destination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PopularSermons extends StatelessWidget {
  final SermonController sermonController = Get.put(SermonController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 270.0,
      child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => MessageDestination(
                            info: sermonController.messages[index],
                          )),
                ),
                child: mostSermon(
                  sermonController.messages[index].imageUrl,
                  sermonController.messages[index].subject,
                  RemoveAllTags.removeAllHtmlTags(
                      sermonController.messages[index].description),
                ),
              );
            },
            itemCount: sermonController.messages.length,
            shrinkWrap: false,
          ),),
    );
  }

  Widget mostSermon(String imageUrl, String subject, String description) {
    return Container(
      padding: EdgeInsets.only(left: 10.0),
      width: 240.0,
      child: Obx(
        () => sermonController.isLoading.value == true
            ? Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(child: CircularProgressIndicator()),
              )
            : Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Wrap(
                  children: [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.fill,
                      width: 240,
                      height: 200,
                    ),
                    ListTile(
                      title: Text(
                        subject,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.red.shade800,
                          fontFamily: 'Montserrat',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        description,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                          fontFamily: 'Roboto',
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
