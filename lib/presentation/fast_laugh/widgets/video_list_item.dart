

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  final String vedioUrl;
  const VideoListItem({super.key, required this.index, required this.vedioUrl});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  late VideoPlayerController _videoPlayerController;
  bool isVolume = true;
  bool isPlay = true;

  @override
  void initState() {
    super.initState();
    VedioController(vediopath: videoPathList[widget.index]);
  }

  void VedioController({required String vediopath}) {
    // ignore: deprecated_member_use
    _videoPlayerController = VideoPlayerController.network(vediopath);
    _videoPlayerController.initialize().then((value) {
      setState(() {
        _videoPlayerController.play();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) {
        setState(() {
          _videoPlayerController.dispose();
        });
        VedioController(vediopath: videoPathList[value]);
      },
      scrollDirection: Axis.vertical,
      children: List.generate(videoPathList.length, (index) {
        return Stack(
          children: [
            SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: _videoPlayerController.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _videoPlayerController.value.aspectRatio,
                        child: VideoPlayer(_videoPlayerController),
                      )
                    :const CupertinoActivityIndicator (
                        radius: 18,
                        color: Colors.white,
                      )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //  left side
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.black.withOpacity(0.5),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                isVolume != isVolume;
                              });
                              if (_videoPlayerController.value.volume == 0.0) {
                                _videoPlayerController.setVolume(1.0);
                              } else {
                                _videoPlayerController.setVolume(0.0);
                              }
                            },
                            icon: const Icon(
                              Icons.volume_off,
                              color: kwhiteColor,
                              size: 30,
                            ))),
                    // right side
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                "https://media.themoviedb.org/t/p/w220_and_h330_face/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg"),
                          ),
                        ),
                        VideoActionsWidget(
                            icon: Icons.emoji_emotions, title: "LOL"),
                        VideoActionsWidget(icon: Icons.add, title: "My List"),
                        VideoActionsWidget(icon: Icons.share, title: "Share"),
                        VideoActionsWidget(
                            icon: Icons.play_arrow, title: "My List"),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class VideoActionsWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionsWidget(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 30,
          ),
          Text(
            title,
            style: const TextStyle(color: kwhiteColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

List<String> videoPathList = [
   "https://assets.mixkit.co/videos/1186/1186-720.mp4",
    "https://assets.mixkit.co/videos/1191/1191-720.mp4",
    "https://assets.mixkit.co/videos/1197/1197-720.mp4",
    "https://assets.mixkit.co/videos/1185/1185-720.mp4",
    "https://assets.mixkit.co/videos/1188/1188-720.mp4"

];
