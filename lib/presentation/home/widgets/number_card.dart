import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';



class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index,required this.url});
  final int index;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 130,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: kRadius10,
                image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imageBase+url)),
              ),
            ),
          ],
        ),
        Positioned(
            left: 13,
            bottom: -40,
            child: BorderedText(
                strokeWidth: 10.0,
                strokeColor: kwhiteColor,
                child: Text(
                  '${index + 1}',
                  style: const TextStyle(
                      fontSize: 140,
                      color: kBlackColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      decorationColor: Colors.black),
                ))),
      ],
    );
  }
}
