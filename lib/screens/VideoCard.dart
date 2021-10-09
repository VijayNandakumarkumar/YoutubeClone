import 'package:flutter/material.dart';
import 'package:youtube/models/VideoMetadataModel.dart';

class VideoCard extends StatelessWidget {

  final VideoMetadataModel videoMetadata;


  VideoCard(this.videoMetadata);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: Colors.grey,
          child: Image.asset(
            videoMetadata.thumbnailUrl,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
        Container(
            padding: EdgeInsets.only(top: 5, right: 7),
            width: MediaQuery.of(context).size.width,
            height: 60,
            color: Color(0xFF282828),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 60,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(videoMetadata.userLogoUrl),
                        backgroundColor: Colors.transparent,
                      )),
                  Container(
                    padding: EdgeInsets.only(left: 2),
                    width: MediaQuery.of(context).size.width - 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            videoMetadata.videoTitle,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            )),
                        SizedBox(height: 2),
                        Container(
                            width: MediaQuery.of(context).size.width - 100,
                            child: Text(
                                videoMetadata.userName +
                                    " - " +
                                    videoMetadata.viewCount +
                                    " - " +
                                    videoMetadata.postedOn,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500)))
                      ],
                    ),
                  ),
                  Container(
                    width: 10,
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  ),
                ])),
      ],
    );
  }
}
