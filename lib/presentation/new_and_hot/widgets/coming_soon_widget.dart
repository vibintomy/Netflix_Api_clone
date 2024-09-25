import 'package:flutter/material.dart';
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/vedio_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  final Movie upcommingsoon;
  const ComingSoonWidget({
    super.key,required this.upcommingsoon
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FEB",
                style: TextStyle(fontSize: 16, color: kgrey),
              ),
              Text(
                '11',
                style: TextStyle(
                    fontSize: 30,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VedioWidget(mainimage:upcommingsoon.imagePath,),
             Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(

                    child: Text(
                      overflow: TextOverflow.ellipsis,
                     
                                    upcommingsoon.title ,
                      style: const TextStyle(
                          fontSize: 25,
                          letterSpacing: -3,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
              const    Spacer(),
              const    Row(
                    children: [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind me',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kwidth,
                    ],
                  )
                ],
              ),
              kheight,
            const  Text('Coming on Friday'),
              kheight,
              Text(
                upcommingsoon.title,
                style:const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                 upcommingsoon.overview,
                  style:const TextStyle(color: kgrey),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
