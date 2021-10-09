import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube/screens/HomePage.dart';

class Youtubehome extends StatefulWidget {
  @override
  _YoutubehomeState createState() => _YoutubehomeState();
}

class _YoutubehomeState extends State<Youtubehome> with SingleTickerProviderStateMixin{
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
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
        leading: Container(
          padding: EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Image.asset("assets/logo.png",width: 40,)
            ],
          ),
        ),
        title: Text("Youtube", style: TextStyle(fontFamily: GoogleFonts.oswald().fontFamily, fontWeight: FontWeight.w400, fontSize: 25),),
        actions: [
          Container(
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
                    child: Icon(Icons.person, color: Colors.black,),
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
        color: Color(0xFF282828),
        child: TabBar(
          controller: _tabController,
          indicatorColor: Colors.transparent,
          labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
          tabs: [
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  SizedBox(height: 3,),
                  Text("Home", style: TextStyle(fontSize: 10))
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/shorts.jpeg", width: 25,),
                  SizedBox(height: 3,),
                  Text("Shorts", style: TextStyle(fontSize: 10))
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle_outline_sharp, size: 40,),
                  SizedBox(height: 3,),
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.subscriptions_outlined),
                  SizedBox(height: 3,),
                  Text("Subscriptions", style: TextStyle(fontSize: 10))
                ],
              ),
            ),
            Tab(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.video_library_outlined),
                  SizedBox(height: 3,),
                  Text("Library", style: TextStyle(fontSize: 10))
                ],
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomePage(),
          Container(color: Colors.blue,),
          Container(color: Colors.red,),
          Container(color: Colors.green,),
          Container(color: Colors.pink,),
        ],
      ),
    );
  }
}
