import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 250,
          margin: EdgeInsets.symmetric(horizontal: 10), 
      decoration: BoxDecoration(
        borderRadius: kRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
          "https://media.themoviedb.org/t/p/w220_and_h330_face/kKgQzkUCnQmeTPkyIwHly2t6ZFI.jpg")),
    
      ),
    );
  }
}