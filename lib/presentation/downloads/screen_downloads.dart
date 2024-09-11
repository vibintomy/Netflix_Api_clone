import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  ScreenDownloads({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w220_and_h330_face/m2zXTuNPkywdYLyWlVyJZW2QOJH.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg",
    "https://media.themoviedb.org/t/p/w220_and_h330_face/wWba3TaojhK7NdycRhoQpsG0FaH.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView(
          children: [
            Row(
              children: const [
                Kwidth,
                Icon(
                  Icons.settings,
                  color: KwhiteColor,
                ),
                Kwidth,
                Text("Smart Downloads")
              ],
            ),
            Text("Introducing Downloads for you"),
            Text(
                "We will download a personalised selection of movies and shows for you, so there is always something to watch on your ddevice"),
            Container(
              width: size.width,
              height: size.width,
              color: KwhiteColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.37,
                  ),
                  DownloadsImageWidget(
                    imageList: imageList[0],
                    margin: EdgeInsets.only(left: 130, bottom: 50),
                    angle: 20,
                    size: Size(size.width * 0.4, size.width * 0.58),
                  ),
                  DownloadsImageWidget(
                    imageList: imageList[1],
                    margin: EdgeInsets.only(right: 130, bottom: 50),
                    angle: -20,
                    size: Size(size.width * 0.4, size.width * 0.58),
                  ),
                  DownloadsImageWidget(
                    imageList: imageList[2],
                    radius: 30,
                    margin: EdgeInsets.only(bottom: 10),
                    size: Size(size.width * 0.5, size.width * 0.65),
                  ),
                ],
              ),
            ),
            MaterialButton(
              color: KbuttonColorBlue,
              onPressed: () {},
              child: const Text(
                "Setup",
                style: TextStyle(
                    color: KwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MaterialButton(
              color: Kbuttonwhite,
              onPressed: () {},
              child: const Text(
                "See what you can download",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ));
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget({
    super.key,
    required this.imageList,
    this.angle = 0,
    required this.margin,
    required this.size,
    this.radius=10,
  });

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Container(
          margin: margin,
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
          
            image: DecorationImage(
              image: NetworkImage(imageList),
            ),
          ),
        ),
      ),
    );
  }
}
