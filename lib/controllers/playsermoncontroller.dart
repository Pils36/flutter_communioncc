import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class PlaySermonController extends GetxController {
  var playing = false.obs;

  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();

  AudioCache cache;

  String audioState;

  @override
  void onInit() {
    sermonDuration();
    currPosition();
    super.onInit();
  }

  Widget stopMin = Text(
    "-:--:--",
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Roboto",
    ),
  );
  Widget startMin = Text(
    "-:--:--",
    style: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Roboto",
    ),
  );

  void getAudio(url) async {
    var res;

    // playing is false by default
    if (playing(false)) {
      // Pause song

      res = await audioPlayer.pause();

      if (res == 1) {
        playing(false);
      }
    } else {
      // Play song
      res = await audioPlayer.play(url, isLocal: false);

      if (res == 1) {
        playing(true);
      }
    }

    stopSermon();
  }

  void sermonDuration() {
    // This is the duration of the file

    audioPlayer.onDurationChanged.listen((Duration dd) {
      duration = dd;
      stopMin = Text(
        "${duration.toString().split('.').first.obs}",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Roboto",
        ),
      );
    });
  }

  void currPosition() {
    // On player change
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      position = dd;
      startMin = Text(
        "${position.toString().split('.').first.obs}",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: "Roboto",
        ),
      );
      print(startMin);
    });
  }

  void stopSermon() {
    // On player completion
    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == AudioPlayerState.STOPPED) audioState = "Stopped";
      if (playerState == AudioPlayerState.PLAYING) audioState = "Playing";
      if (playerState == AudioPlayerState.PAUSED) audioState = "Paused";
    });
  }

  void seekSec(int value) {
    Duration newPos = Duration(seconds: value);
    audioPlayer.seek(newPos);
  }
}
