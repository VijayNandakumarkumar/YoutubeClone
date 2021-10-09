import 'package:flutter/material.dart';
import 'package:youtube/Constants.dart';
import 'package:youtube/screens/VideoCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int selectedIndex = 1;
    return SingleChildScrollView(
      child: Column(children: [
        Divider(
          thickness: 0.2,
          color: Colors.grey.withOpacity(0.3),
          height: 0.2,
        ),
        Container(
          height: 45,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFF282828),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Constants.tabs.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          height: 28,
                          width: 80,
                          color: Colors.grey.withOpacity(0.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 1, bottom: 3),
                                height: 18,
                                child: Icon(
                                  Icons.explore_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "Explore",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                      VerticalDivider(
                        thickness: 2,
                        indent: 4,
                        endIndent: 4,
                        color: Colors.grey,
                      )
                    ],
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.all(8),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 28,
                          decoration: BoxDecoration(
                            color: (index == selectedIndex)
                                ? Colors.grey[200]
                                : Colors.grey.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                width: 0.2,
                                color: Colors.grey.withOpacity(0.3)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6, horizontal: 8.0),
                            child: Text(
                              Constants.tabs[index - 1],
                              style: TextStyle(
                                  color: (index == selectedIndex)
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        )),
                  );
                }
              }),
        ),
        Divider(
          thickness: 0.2,
          color: Colors.grey.withOpacity(0.3),
          height: 0.2,
        ),
        Container(
            height: MediaQuery.of(context).size.height - 185,
            // color: Colors.greenAccent,
            child: ListView.builder(
                itemCount: Constants.videosModel.length,
                itemBuilder: (context, index) {
                  return VideoCard(Constants.videosModel[index]);
                }))
      ]),
    );
  }
}
