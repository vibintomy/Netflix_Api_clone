import 'dart:async';  
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/application/controller/controller_movie.dart';  
import 'package:netflix_clone/application/model/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final controller = TextEditingController();
  List<Movie> popular = [];
  List<Movie> searchResult = [];
  bool isIdle = true;  

  Timer? _debounce;  

  @override
  void initState() {
    super.initState();
    getPopularMovies();  
  }

  @override
  void dispose() {
    controller.dispose();
    _debounce?.cancel();  
    super.dispose();
  }

  
  Future<void> getPopularMovies() async {
    try {
      popular = await MovieService.getPopularMovies();
      setState(() {});
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching popular movies: $e');
      }
    }
  }

  
  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();  

    _debounce = Timer(const Duration(milliseconds: 500), () {  
      if (query.isEmpty) {
        setState(() {
          isIdle = true;  
          searchResult.clear();
        });
      } else {
        _fetchDataFromServer(query);
      }
    });
  }

 
  Future<void> _fetchDataFromServer(String query) async {
    if (query.isEmpty) return;

    try {
      List<Movie> result = await _searchMovies(query);  
      setState(() {
        isIdle = false;
        searchResult = result;
      });
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching data from server: $e');
      }
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
                onChanged: _onSearchChanged,  
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: const Icon(CupertinoIcons.search, color: Colors.grey),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill, color: Colors.grey),
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 10),  
              _buildResultList(),
            ],
          ),
        ),
      ),
    );
  }

 
  Widget _buildResultList() {
    return Expanded(
      child: isIdle
          ? SearchIdleWidget(result: popular.isNotEmpty ? popular : [])
          : SearchResultWidget(result: searchResult),
    );
  }

  
  Future<List<Movie>> _searchMovies(String query) async {
    const apiKey = '40593451ff38fa9a7193007aa1a82c8c';
    const baseUrl = 'https://api.themoviedb.org/3/search/movie';

    try {
      final response = await http.get(Uri.parse('$baseUrl?api_key=$apiKey&query=$query'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body)['results'];
        return data.map((json) => Movie.fromJson(json)).toList().cast<Movie>();
      } else {
        if (kDebugMode) {
          print('Failed to fetch movies. Status code: ${response.statusCode}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching search results: $e');
      }
    }

    return [];
  }
}
