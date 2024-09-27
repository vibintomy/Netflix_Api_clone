import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:netflix_clone/application/model/movie_model.dart';

class MovieService {
  

  static const _nowplaying =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=40593451ff38fa9a7193007aa1a82c8c';
  static const _upcomming =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=40593451ff38fa9a7193007aa1a82c8c';

  static const String _popular =
      'https://api.themoviedb.org/3/movie/popular?api_key=40593451ff38fa9a7193007aa1a82c8c';

  static const _toprated =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=40593451ff38fa9a7193007aa1a82c8c';

  static Future<List<Movie>> getNowPlayingMovies() async {
    const int maxRetries = 3;
    int retryCount = 0;

    while (retryCount < maxRetries) {
      try {
        final response = await http.get(Uri.parse(_nowplaying));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
       print('Error fetching now playing movies: $e');
      }

      retryCount++;
    }

    return [];
  }

  static Future<List<Movie>> getTopRatedMovies() async {
    const int maxtries = 3;
    int retrycout = 0;
    while (retrycout < maxtries) {
      try {
        final response =
            await http.get(Uri.parse(_toprated));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error while fetching the data');
      }
      retrycout++;
    }
    return [];
  }

  static Future<List<Movie>> getPopularMovies() async {
    int maxtries = 3;
    int retryCount = 0;
    while (retryCount < maxtries) {
      try {
        final response = await http.get(Uri.parse(_popular));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error while fetching the data');
      }
      retryCount++;
    }
    return [];
  }

  static Future<List<Movie>> getUpCommingmovies() async {
    const int maxtries = 3;
    int retrycount = 0;
    while (retrycount < maxtries) {
      try {
        final response = await http.get(Uri.parse(_upcomming));
        if (response.statusCode == 200) {
          final List<dynamic> data = jsonDecode(response.body)['results'];
          return data
              .map((json) => Movie.fromJson(json))
              .toList()
              .cast<Movie>();
        }
      } catch (e) {
        print('Error while fetching the data');
      }
      retrycount++;
    }
    return [];
  }
}
