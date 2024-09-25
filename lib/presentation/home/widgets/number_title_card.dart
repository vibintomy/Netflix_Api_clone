import 'package:flutter/material.dart';
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/home/widgets/number_card.dart';
import 'package:netflix_clone/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<Movie> popular;
  const NumberTitleCard({
    super.key,required this.popular
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(title: 'Top 10 TV shows In Indias Today'),
        kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                popular.length,
                (index) => NumberCard(
                     url: popular[index].imagePath,
                     index: index,
                    )),
          ),
        )
      ],
    );
  }
}
