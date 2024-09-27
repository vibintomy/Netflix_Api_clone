import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';

const image =
     'https://media.themoviedb.org/t/p/w533_and_h300_bestv2/4woSOUD0equAYzvwhWBHIJDCM88.jpg';

class SearchIdleWidget extends StatelessWidget {
 final List<Movie> result;
 const SearchIdleWidget({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchTextTitle(
          title: 'Top Searches',
        ),
        kheight,
        Expanded(
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                if (index < result.length) {
                  return TopSearchItemTile(
                    nameMovie: result[index].title,
                    imageurl: result[index].imagePath,
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              separatorBuilder: (ctx, index) => kheight20,
              itemCount: result.length),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final String imageurl;
  final String nameMovie;
  const TopSearchItemTile(
      {super.key, required this.imageurl, required this.nameMovie});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration:  BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: NetworkImage(imageBase+imageurl),
            ),
          ),
        ),
         Expanded(
            child: Text(
          nameMovie,
          style:const TextStyle(
              color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
        )),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: Center(
            child: CircleAvatar(
              backgroundColor: kBlackColor,
              radius: 22,
              child: Icon(
                CupertinoIcons.play_fill,
                color: kwhiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
