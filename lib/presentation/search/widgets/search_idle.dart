import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/title.dart';


  const imageUrl = 
    "https://media.themoviedb.org/t/p/w250_and_h141_face/93SxdkiR3gBcbG5FxIt0DCBttul.jpg";
  

class SearchIdleWidget extends StatelessWidget {
const   SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
   const   SearchTextTitle(title: 'Top Searches',),
        kheight,
         Expanded(
           child: ListView.separated(
            shrinkWrap: true,
            itemBuilder:(ctx , index)=>const TopSearchItemTile(),
            separatorBuilder: (ctx , index)=> kheight20,
             itemCount: 10),
         )
      ],
    );
  }
}


class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(children: [
      Container(
        width: screenWidth *0.35,
        height: 65,
        decoration:const BoxDecoration(
         image: DecorationImage(
            fit: BoxFit.contain,
            image: NetworkImage(imageUrl),),

        ),
      ),
    const  Expanded(child: Text('Movie Name',style: TextStyle(color: KwhiteColor,fontWeight: FontWeight.bold,fontSize: 16 ),)),
   const CircleAvatar(
      backgroundColor: KwhiteColor,
      radius: 25,
      child: Center(
        child: CircleAvatar(
          backgroundColor: kBlackColor,
          radius: 22,
          child:  Icon(
            CupertinoIcons.play_fill,
            color: KwhiteColor,
          ),
        ),
      ),
    )
    ],);
  }
}