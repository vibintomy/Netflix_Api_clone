import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/screen_downloads.dart';
import 'package:netflix_clone/presentation/downloads/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/fast_laugh/scree_fast_laugh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';

import 'package:netflix_clone/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final pages = [
 const   ScreenHome(),
  const  ScreenNewAndHot(),
   const ScreeFastLaugh(),
  const  ScreenSearch(),
    ScreenDownloads()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, _) {
            return pages[index];
          },
        ),
      ),
      bottomNavigationBar:const BottomNavigationWidget(),
    );
  }
}
