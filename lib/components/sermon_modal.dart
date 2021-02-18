import 'package:audioplayers/audio_cache.dart';
import 'package:communioncc/models/messages.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SermonModal extends StatefulWidget {
  final Messages info;

  SermonModal({Key key, this.info}) : super(key: key);

  @override
  _SermonModalState createState() => _SermonModalState();
}

class _SermonModalState extends State<SermonModal> {
  AudioPlayer audioPlayer = new AudioPlayer();
  Duration duration = new Duration();
  Duration position = new Duration();

  AudioCache cache;

  String audioState;

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

  bool playing = false;

  Icon playBtn = Icon(
    Icons.play_arrow,
    size: 60,
  );

  @override
  void initState() {
    _sermonDuration();
    _currPosition();

    super.initState();
  }

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 450,
                constraints: BoxConstraints.expand(),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Image(
                            image: NetworkImage(widget.info.imageUrl),
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                          top: 10,
                          bottom: 5,
                        ),
                        child: Text(
                          widget.info.subject,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Roboto",
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "Pastor Tope Awofisayo",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Roboto",
                        ),
                      ),
                      // Progress bar
                      slider(),

                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.fast_rewind,
                            size: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              getAudio();

                              if (playing == false) {
                                if (mounted) {
                                  setState(() {
                                    playBtn = Icon(
                                      Icons.pause,
                                      size: 60,
                                    );
                                  });
                                }
                              } else {
                                setState(() {
                                  playBtn = Icon(
                                    Icons.play_arrow,
                                    size: 60,
                                  );
                                });
                              }
                            },
                            child: playBtn,
                          ),
                          Icon(
                            Icons.fast_forward,
                            size: 30,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showModalBottomSheet(context);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Image.asset(
              "assets/play.png",
              width: 30,
              height: 30,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text("Listen",
              style: TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Montserrat',
              )),
        ],
      ),
    );
  }

  Widget slider() {
    return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          startMin,
          Slider.adaptive(
            activeColor: Colors.orange.shade600,
            inactiveColor: Colors.grey.shade300,
            min: 0.0,
            value: position.inSeconds.toDouble(),
            max: duration.inSeconds.toDouble(),
            onChanged: (double value) {
              setState(() {
                // audioPlayer.seek(new Duration(seconds: value.toInt()));
                seekSec(value.toInt());
                value = value;
              });
            },
          ),
          stopMin,
        ],
      );
    });
  }

  void getAudio() async {
    var url = widget.info.messageUrl;
    var res;

    // playing is false by default
    if (playing) {
      // Pause song

      res = await audioPlayer.pause();

      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      // Play song
      res = await audioPlayer.play(url, isLocal: false);

      if (res == 1) {
        if (mounted) {
          setState(() {
            playing = true;
          });
        }
      }
    }

    _stopSermon();
  }

  void _sermonDuration() {
    // This is the duration of the file

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
        stopMin = Text(
          "${duration.toString().split('.').first}",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
          ),
        );
      });
    });
  }

  void _currPosition() {
    // On player change
    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
        startMin = Text(
          "${position.toString().split('.').first}",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontFamily: "Roboto",
          ),
        );
        print(startMin);
      });
    });
  }

  void _stopSermon() {
    // On player completion
    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if (playerState == AudioPlayerState.STOPPED) audioState = "Stopped";
      if (playerState == AudioPlayerState.PLAYING) audioState = "Playing";
      if (playerState == AudioPlayerState.PAUSED) audioState = "Paused";

      setState(() {});
    });
  }

  void seekSec(int value) {
    Duration newPos = Duration(seconds: value);
    audioPlayer.seek(newPos);
  }
}
