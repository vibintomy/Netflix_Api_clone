import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VedioWidget extends StatelessWidget {
  const VedioWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.red,
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
