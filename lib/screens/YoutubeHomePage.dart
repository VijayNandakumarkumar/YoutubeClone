import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube/screens/Home.dart';

class YoutubeHomePage extends StatefulWidget {
  @override
  _YoutubeHomePageState createState() => _YoutubeHomePageState();
}

class _YoutubeHomePageState extends State<YoutubeHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 0);
  }
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF282828),
        leadingWidth: MediaQuery.of(context).size.width,
        titleSpacing: -85,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Image.asset(
                "assets/logo.png",
                width: 40,
              ),
            ],
          ),
        ),
        title: Text(
          "YouTube",
          style: GoogleFonts.oswald(fontSize: 26, fontWeight: FontWeight.w400),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            width: MediaQuery.of(context).size.width - 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.cast),
                Icon(Icons.notifications_none),
                Icon(Icons.search),
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                    ),
                    backgroundColor: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(color: Color(0xFF282828)),
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
          controller: _tabController,

          tabs: [
            Tab(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Home",
                      style: TextStyle(fontSize: 10),
                    ),
                  ]),
            ),
            Tab(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.explore_outlined),
                    Image.asset("assets/shorts.jpeg", height: 25,),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Shorts",
                      style: TextStyle(fontSize: 10),
                    ),
                    //   Image.asset("assets/shorts",)
                  ]),
            ),
            Tab(
              icon: Icon(Icons.add_circle_outline_sharp, size: 40),
              //     child: Column(children: [
              //     Icon(Icons.add_circle_outline_sharp, size: 40),
              //
              // ]),
            ),
            Tab(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.subscriptions_outlined),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Subscriptions",
                      style: TextStyle(fontSize: 10),
                    ),
                  ]),
            ),
            Tab(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.video_library_outlined),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "Library",
                      style: TextStyle(fontSize: 10),
                    ),
                  ]),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
          children: [
        Home(),
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.greenAccent,),
        Container(color: Colors.cyan,)
      ]),
    );
  }
}
