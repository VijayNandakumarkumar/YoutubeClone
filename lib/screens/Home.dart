import 'package:flutter/material.dart';
import 'package:youtube/Constants.dart';
import 'package:youtube/widgets/VideoCard.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Divider(thickness: 0.3, color: Colors.grey.withOpacity(0.3), height: 0.2,),
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
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 28,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 18,
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
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        VerticalDivider(
                          thickness: 2,
                          indent: 4,
                          endIndent: 4,
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                                color: Colors.grey,
                                width: 0.4,
                              )),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 6.0, horizontal: 10.0),
                            child: Text(
                              Constants.tabs[index - 1],
                              style: TextStyle(
                                  color: index == selectedIndex
                                      ? Colors.black
                                      : Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                })),
        Divider(thickness: 0.3, color: Colors.grey.withOpacity(0.3), height: 0.2,),
        Container(
          height: MediaQuery.of(context).size.height - 185,
          child: ListView.builder(
              itemCount: Constants.videosModel.length,
              itemBuilder: (context, index) {
                print("The lenght is " + Constants.videosModel.length.toString());
                return VideoCard(Constants.videosModel[index]);
              }),
        )
        // test1(),
      ]),
    );
  }
}
