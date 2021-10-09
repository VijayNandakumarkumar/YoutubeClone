import 'package:flutter/material.dart';
import 'package:youtube/models/VideoMetadataModel.dart';

class VideoCard extends StatelessWidget {
  final VideoMetadataModel videoMetadataModel;

  VideoCard(this.videoMetadataModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          color: Color(0xFF282828),
          child: Image.asset(
            videoMetadataModel.thumbnailUrl,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 5, right: 5),
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
                  backgroundImage: AssetImage(videoMetadataModel.userLogoUrl),
                  backgroundColor: Colors.transparent,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                width: MediaQuery.of(context).size.width - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoMetadataModel.videoTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 100,
                      child: Text(
                        videoMetadataModel.userName +
                            " - " +
                            videoMetadataModel.viewCount +
                            " - " +
                            videoMetadataModel.postedOn,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 10,
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
