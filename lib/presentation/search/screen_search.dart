import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/controller/controller_movie.dart';
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';
import 'package:http/http.dart' as http;

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final controller = TextEditingController();
  List<Movie> popular = [];
  List<Movie> searchResult = [];
  bool istapped = false;

  @override
  void initState() {
    super.initState();
    getpopular();
    controller.addListener(_onSearchChanges);
  }

  @override
  void dispose() {
    controller.removeListener(_onSearchChanges);
    controller.dispose();
    super.dispose();
  }

  Future<void> getpopular() async {
    popular = await MovieService.getPopularMovies();
    setState(() {});
  }

  void _onSearchChanges() async {
    if (controller.text.isEmpty) {
      setState(() {
        istapped = true;
        searchResult.clear();
      });
    } else {
      await _fetchdatafromServer(controller.text);
    }
  }

  Future<void> _fetchdatafromServer(String query) async {
    if (query.isEmpty) return; // Avoid making a request with an empty query

    try {
      List<Movie> result = await searchFunction(query);
      setState(() {
        istapped = false; // Display search results instead of popular
        searchResult = result;
      });
    } catch (e) {
      print('Error in fetching data: $e'); // Better logging
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                controller: controller,
                onChanged: (value) {
                  setState(() {
                    istapped = value.isEmpty;
                  });
                  _fetchdatafromServer(value);
                },
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey),
                style: const TextStyle(color: Colors.white),
              ),
              kheight,
              _buildResultList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildResultList() {
    return Expanded(
      child: istapped
          ? SearchIdleWidget(result: popular.isNotEmpty ? popular : [])
          : SearchResultWidget(result: searchResult),
    );
  }

  Future<List<Movie>> searchFunction(String query) async {
    const apiKey = '40593451ff38fa9a7193007aa1a82c8c';
    const baseUrl = 'https://api.themoviedb.org/3/search/movie';

    try {
      final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey&query=$query'));

      if (response.statusCode == 200) {
      
        final List<dynamic> data = jsonDecode(response.body)['results'];
        return data.map((json) => Movie.fromJson(json)).toList().cast<Movie>();
      } else {
        print('Failed to fetch movies. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error in fetching data: $e');
    }

    return [];
  }
}
