import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/controller/controller_movie.dart';
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'widgets/everyones_watching_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  List<Movie> upcommingMovies = [];
  List<Movie> popularMovies = [];
  bool isLoading = true;
  bool isError = false;

  Future<void> upCommingMovies() async {
    try {
      List<Movie> movies = await MovieService.getUpCommingmovies();
      List<Movie> popular = await MovieService.getPopularMovies();
      setState(() {
        upcommingMovies = movies;
        popularMovies = popular;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching movies $e');
      setState(() {
        isError = true;
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
   
    super.initState();
    upCommingMovies();
  }

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
                      color: kwhiteColor)),
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
                  unselectedLabelColor: kwhiteColor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kwhiteColor, borderRadius: kRadiou30),
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
            children: [
              isLoading
              ? const Center(child: CupertinoActivityIndicator(
                radius: 25,
                color: Colors.white,
              ))
              :isError
              ? const Center(child: Text('error in fetching data'),)
              : BuildCommingSoon(commingSoon:upcommingMovies )
             , BuildEveyoneIsWatching(popularMovies:popularMovies )]),
      ),
    );
  }
}


class BuildCommingSoon extends StatelessWidget {
  final List commingSoon;
  const BuildCommingSoon({super.key, required this.commingSoon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: commingSoon.length,
        itemBuilder: (BuildContext context, index) => ComingSoonWidget(upcommingsoon:commingSoon[index] ,));
  }
}

class BuildEveyoneIsWatching extends StatelessWidget {
  final List popularMovies;
  const BuildEveyoneIsWatching({super.key, required this.popularMovies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, index) =>EveryonesWatchWidget(
           everyone: popularMovies[index],
            ));
  }
}

