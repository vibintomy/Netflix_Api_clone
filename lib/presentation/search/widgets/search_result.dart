import 'package:flutter/material.dart';
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const imageUrl =
   'https://image.tmdb.org/t/p/w600_and_h900_bestv2/sK6Nr6KNUA4WlAHyNBTioz9FK87.jpg';

class SearchResultWidget extends StatelessWidget {
  final List<Movie> result;
  const SearchResultWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Movies & TV'),
        kheight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(result.length, (index) {
              return  MainCard(
                url: result[index].imagePath,
              );
            }),
          ),
        ),
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String? url;
  const MainCard({super.key,this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image:  DecorationImage(
            image: NetworkImage(imageBase+url!), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(7),
      ),
    );
  }
}
