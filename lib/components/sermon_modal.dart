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

  bool playing = false;

  Image playBtn = Image(
    image: AssetImage("assets/play_sermon.png"),
    width: 50,
    height: 50,
  );

  _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
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
                      Image.asset(
                        "assets/replay-back-10.png",
                        width: 30,
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          getAudio(widget.info.messageUrl);

                          if (playing == false) {
                            if (mounted) {
                              setState(() {
                                playBtn = Image(
                                  image: AssetImage("assets/pause.png"),
                                  width: 50,
                                  height: 50,
                                );
                              });
                            }
                          } else {
                            setState(() {
                              playBtn = Image(
                                image: AssetImage("assets/play_sermon.png"),
                                width: 50,
                                height: 50,
                              );
                            });
                          }
                        },
                        child: playBtn,
                      ),
                      Image.asset(
                        "assets/replay-forward-10.png",
                        width: 30,
                        height: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
    return Slider.adaptive(
      min: 0.0,
      value: position.inSeconds.toDouble(),
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {
          audioPlayer.seek(new Duration(seconds: value.toInt()));
        });
      },
    );
  }

  void getAudio(link) async {
    var url = link;

    // playing is false by default
    if (playing) {
      // Pause song

      var res = await audioPlayer.pause();

      if (res == 1) {
        setState(() {
          playing = false;
        });
      }
    } else {
      // Play song
      var res = await audioPlayer.play(url, isLocal: false);

      if (res == 1) {
        if (mounted) {
          setState(() {
            playing = true;
          });
        }
      }
    }

    audioPlayer.onDurationChanged.listen((Duration dd) {
      setState(() {
        duration = dd;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((Duration dd) {
      setState(() {
        position = dd;
      });
    });
  }
}
