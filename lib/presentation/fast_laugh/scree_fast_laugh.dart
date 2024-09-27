import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/fast_laugh/widgets/video_list_item.dart';

class ScreeFastLaugh extends StatelessWidget {
  const ScreeFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: PageView(
              scrollDirection: Axis.vertical,
      children: List.generate(videoPathList.length, (index) {
        return VideoListItem(index: index,vedioUrl: videoPathList[index],);
      }),
    )));
  }
}
