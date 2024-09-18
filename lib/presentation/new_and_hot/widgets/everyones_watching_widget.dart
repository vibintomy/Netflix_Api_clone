import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../../core/colors/colors.dart';
import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/vedio_widget.dart';


class EveryonesWatchWidget extends StatelessWidget {
  const EveryonesWatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        Text(
          'Friends',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'This hit sitcin follows the merry misadventures of six 20- something falls as they navigate the pitfalls of work , life and love in 1990s',
          style: TextStyle(color: kgrey),
        ),
        kheight50,
        VedioWidget(),
        kheight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
