import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

import '../../home/widgets/custom_button_widget.dart';
import '../../widgets/vedio_widget.dart';


class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
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
          child:const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VedioWidget(),
               Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tall Grl 2',
                    style: TextStyle(
                        fontSize: 30,
                        letterSpacing: -5,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
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
               Text('Coming on Friday'),
              kheight,
             Text(
                'Tall girl 2',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Landing the lead in the school musical is a dream come true for jodin, until the pressure sends her confidence - and her relationship - into a tailspan',
                style: TextStyle(color: kgrey),
              )
            ],
          ),
        ),
      ],
    );
  }
}

