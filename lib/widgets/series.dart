import 'package:communioncc/controllers/seriescontroller.dart';
import 'package:communioncc/screens/series_destination.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Series extends StatelessWidget {
  final SeriesController seriesController = Get.put(SeriesController());

  Widget mostSermon(String imageVal) {
    return Container(
      width: 250.0,
      padding: EdgeInsets.only(left: 10.0),
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Obx(() {
          if (seriesController.isLoading.value == true) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Image.network(
              imageVal,
              fit: BoxFit.fill,
            );
          }
        }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      height: 200.0,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => SeriesDestination(
                            info: seriesController.messages[index],
                          )),
                );
              },
              child: Hero(
                tag: seriesController.messages[index].subject,
                child: mostSermon(
                  seriesController.messages[index].imageUrl,
                ),
              ),
            );
          },
          itemCount: seriesController.messages.length,
          shrinkWrap: true,
        ),
      ),
    );
  }
}
