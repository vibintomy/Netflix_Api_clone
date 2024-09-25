import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';

class VedioWidget extends StatefulWidget {
  final String mainimage;
  const VedioWidget({
    super.key,required this.mainimage
  });

  @override
  State<VedioWidget> createState() => _VedioWidgetState();
}

class _VedioWidgetState extends State<VedioWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
        child: Image.network(imageBase+widget.mainimage,
        fit: BoxFit.cover,),
        
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
              radius: 22,
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.volume_off,
                    color: KwhiteColor,
                    size: 20,
                  ))),
        ),
      ],
    );
  }
}
