import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              elevation: 0,
              title: const Text('New & Hot',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: KwhiteColor)),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                ),
                kwidth,
                Container(
                  width: 30,
                  height: 30,
                  color: Colors.blue,
                ),
                kwidth,
              ],
              bottom: TabBar(
                  labelColor: kBlackColor,
                  unselectedLabelColor: KwhiteColor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: KwhiteColor, borderRadius: kRadiou30),
                  tabs: const [
                    Tab(
                      text: "🍿 Coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone's Watching",
                    )
                  ]),
            )),
        body: TabBarView(
            children: [_buildComingSoon(), _buildEveryonesWatching()]),
      ),
    );
  }

  Widget _buildComingSoon() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) => const ComingSoonWidget());
  }

  Widget _buildEveryonesWatching() {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (BuildContext contex, index) =>
            const EveryonesWatchWidget());
  }
}
