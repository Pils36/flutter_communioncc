import 'package:communioncc/clients/api_clients.dart';
import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/models/messages.dart';
import 'package:communioncc/screens/message_destination.dart';
import 'package:communioncc/services/remote_services.dart';
import 'package:flutter/material.dart';

class RecentSermons extends StatefulWidget {
  @override
  _RecentSermonsState createState() => _RecentSermonsState();
}

class _RecentSermonsState extends State<RecentSermons> {
  List<Messages> thismessages = List<Messages>();

  Future<List<Messages>> recentSermons() async {
    var url = "${ApiClients().baseUrl}/message/recentsermons";

    var thismessages = RemoteServices.fetchSermons(url);

    return thismessages;
  }

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
              child: FutureBuilder(
                future: recentSermons(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Image.network(
                      imageVal,
                      fit: BoxFit.fill,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
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
  void initState() {
    recentSermons().then((value) {
      if (mounted) {
        setState(() {
          thismessages.addAll(value);
        });
      }
    });

    super.initState();
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
                        info: thismessages[index],
                      )),
            ),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  newSermons(
                    thismessages[index].imageUrl,
                    thismessages[index].subject,
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
        itemCount: thismessages.length,
        shrinkWrap: true,
      ),
    );
  }
}
