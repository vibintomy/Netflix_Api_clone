import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,required this.image
  });
  final String image;

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
              imageBase+image)),
      ),
    );
  }
}
