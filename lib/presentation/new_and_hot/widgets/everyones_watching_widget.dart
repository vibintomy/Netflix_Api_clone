import 'package:flutter/material.dart';
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../../core/colors/colors.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/vedio_widget.dart';

class EveryonesWatchWidget extends StatelessWidget {
  final Movie everyone;
  const EveryonesWatchWidget({
    super.key,required this.everyone
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          everyone.title,
          style:const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
       Text(
         everyone.overview,
          style:const TextStyle(color: kgrey),
        ),
        kheight50,
        VedioWidget(mainimage: everyone.imagePath,),
        kheight,
     const   Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:[
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconSize: 25,
              textSize: 16,
            ),
            kwidth,
          ],
        )
      ],
    );
  }
}
