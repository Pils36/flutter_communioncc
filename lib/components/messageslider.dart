import 'package:communioncc/controllers/playsermoncontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageSlider extends StatelessWidget {
  final PlaySermonController playSermonController =
      Get.put(PlaySermonController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print(playSermonController.stopMin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          playSermonController.startMin,
          Slider.adaptive(
            activeColor: Colors.orange.shade600,
            inactiveColor: Colors.grey.shade300,
            min: 0.0,
            value: playSermonController.position.inSeconds.toDouble(),
            max: playSermonController.duration.inSeconds.toDouble(),
            onChanged: (double value) {
              // audioPlayer.seek(new Duration(seconds: value.toInt()));
              playSermonController.seekSec(value.toInt());
              value = value;
            },
          ),
          playSermonController.stopMin,
        ],
      ),
    );
  }
}
