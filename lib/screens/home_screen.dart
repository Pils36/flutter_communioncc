import 'package:communioncc/constants/color_constant.dart';
import 'package:communioncc/controllers/sermoncontroller.dart';
import 'package:communioncc/screens/message_destination.dart';
import 'package:communioncc/screens/moresermon.dart';
import 'package:communioncc/widgets/broadcast.dart';
import 'package:communioncc/widgets/popular_sermons.dart';
import 'package:communioncc/widgets/recent_sermon.dart';
import 'package:communioncc/widgets/series.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: mBackgroundColour,
          elevation: 0,
          title: TabBar(
            labelColor: Colors.orange.shade900,
            unselectedLabelColor: Colors.black,
            indicatorColor: Colors.black26,
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sermons",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Icon(
                      Icons.mic,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Broadcast",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Roboto",
                      ),
                    ),
                    Icon(
                      Icons.videocam,
                      size: 20.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // Setting up background color
        backgroundColor: mBackgroundColour,
        body: TabBarView(
          children: [
            Container(
              child: ListView(
                physics: ClampingScrollPhysics(),
                children: [
                  // Start Search Field
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 3.0),
                    child: Container(
                      color: Colors.grey.shade200,
                      child: FlatButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: mGreyColour,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                'Search...',
                                style: TextStyle(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w100,
                                    fontFamily: "Roboto",
                                    color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        ),
                        onPressed: () => showSearch(
                            context: context, delegate: DataSearch()),
                      ),
                    ),
                  ),

                  // End Search Field

                  // Start Home Card Section
                  Container(
                    // height: 350.0,
                    width: MediaQuery.of(context).size.width - 100.0,
                    child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset(
                        'assets/pp.jpeg',
                        fit: BoxFit.fill,
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                  ),

                  // Popular Sermons
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Suggested For You',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  PopularSermons(),

                  // Series
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Series',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Series(),

                  // Recent Sermons
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: 'Recent Sermons',
                        style: TextStyle(
                            fontFamily: "Roboto",
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  RecentSermons(),

                  SizedBox(
                    height: 10.0,
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => MoreSermon()),
                        );
                      },
                      color: Colors.grey.shade200,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "VIEW MORE SERMONS",
                            style: TextStyle(
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // End Home Card Section
                ],
              ),
            ),
            Broadcast(),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class DataSearch extends SearchDelegate<String> {
// Call API
  final SermonController sermonController = Get.put(SermonController());

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: action for app bar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: leading icon on the left of the app bar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: show some result based on the selection
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: show when someone searches for something

    final suggestionList = sermonController.messages
        .where((p) => p.subject.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 3),
          child: ListTile(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => MessageDestination(
                        info: suggestionList[index],
                      )),
            ),
            leading: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Image.network(
                suggestionList[index].imageUrl,
                width: 50,
                height: 50,
              ),
            ),
            title: RichText(
              text: TextSpan(
                  text:
                      suggestionList[index].subject.substring(0, query.length),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  children: [
                    TextSpan(
                      text:
                          suggestionList[index].subject.substring(query.length),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
          ),
        );
      },
      itemCount: suggestionList.length,
    );
  }
}
