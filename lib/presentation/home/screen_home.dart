import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/background_card.dart';
import 'package:netflix_clone/presentation/home/widgets/number_title_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, _) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            print(direction);
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(children: [
                BackgroundCard(),
                MainTitleCard(
                  title: 'Released in the past year',
                ),
                kheight,
                MainTitleCard(
                  title: 'Trending Now',
                ),
                kheight,
                NumberTitleCard(),
                kheight,
                MainTitleCard(
                  title: 'Tense Drama',
                ),
                kheight,
                MainTitleCard(
                  title: 'South Indian Cinema',
                ),
              ],
              ),
             scrollNotifier.value== true
             ? AnimatedContainer(
              duration: Duration(milliseconds: 1000),
                width: double.infinity,
                height: 90,
                color: Colors.transparent,
                child: Column(
                  children: [
                    Row(children: [
                          Image.network("https://upload.wikimedia.org/wikipedia/commons/thumb/7/75/Netflix_icon.svg/2048px-Netflix_icon.svg.png",
                    width: 70,
                    height: 70,
                    ),
                      const   Spacer(),
     const   Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kwidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        kwidth,
                    ],),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("TV Shows",style: kHomeTitleText,),
                         Text("Movies",style: kHomeTitleText,),
                          Text("Categories",style: kHomeTitleText,),
                      ],
                    )
                  ],
                ),
              )
              : kheight,
            ],
          ),
        );
      },
    )
    );
  }
}
