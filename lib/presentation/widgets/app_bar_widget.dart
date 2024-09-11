import 'package:flutter/material.dart';
import 'package:netflix_clone/core/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key,required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text( title,
            style:const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
     const   Spacer(),
     const   Icon(
          Icons.cast,
          color: Colors.white,
        ),
        Kwidth,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
        Kwidth,
      ],
    );
  }
}
