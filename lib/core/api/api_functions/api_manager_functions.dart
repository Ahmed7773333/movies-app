import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/constants.dart';

class ApiManager {
  static Future<PopularMoviesItems> getMovies(
      {int index = 1, String q = '', String language = 'en'}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/popular", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed
    });
    Uri url2 = Uri.https(baseUrl, "/3/movie/upcoming", {
      "Authorization": authorizationAccessToken,
      "language": "en-US",
      "api_key": apiKeyAhmed,
      "accept": "application/json"
    });

    Uri url3 = Uri.https(baseUrl, "/3/movie/top_rated", {
      "Authorization": authorizationAccessToken,
      "language": "en-US",
      "api_key": apiKeyAhmed,
      "accept": "application/json"
    });
    Uri searchUrl = Uri.https(baseUrl, "/3/search/movie", {
      "Authorization": authorizationAccessToken,
      "language": 'en',
      "api_key": apiKeyAhmed,
      "accept": "application/json",
      "query": q,
    });

    http.Response response = await http.get(index == 1
        ? url
        : index == 2
            ? url2
            : index == 3
                ? url3
                : searchUrl);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }

  static Future<PopularMoviesItems> getMovieDetails({required int id}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/$id", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
      "id": id
    });

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }

  static Future<PopularMoviesItems> getSimilarMovies({required int id}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/$id/similar", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
    });

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }

  static Future<void> addToWatchlist(Results movie) async {
    final Map<String, dynamic> requestBody = {
      "media_type": "movie",
      "media_id": movie.id,
      "watchlist": true,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGU1MzRkNTcwYzhlYmUzMzNmZTNlNzY2N2JhZjY0MSIsInN1YiI6IjY1M2U0YWVkY2M5NjgzMDE0ZWI5YTFlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ytPBtidiQIlX6E9Qk1zXaLhf0aRP2ZAwNO3raa7DAvs',
      "accept": "application/json",
      "api_key": apiKeyAhmed,
    };

    final Uri uri = Uri.parse(
        'https://api.themoviedb.org/3/account/20637785/watchlist?session_id=f00791981152a1ed9e8ad4b51f3e344ea0b9cc31');

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        // Successfully added to watchlist
        debugPrint('Movie added to watchlist.');
      } else {
        // Handle errors here
        debugPrint(
            'Failed to add movie to watchlist. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  static Future<void> deleteFromWatchlist(Results movie) async {
    final Map<String, dynamic> requestBody = {
      "media_type": "movie",
      "media_id": movie.id,
      "watchlist": false,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      "Authorization":
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGU1MzRkNTcwYzhlYmUzMzNmZTNlNzY2N2JhZjY0MSIsInN1YiI6IjY1M2U0YWVkY2M5NjgzMDE0ZWI5YTFlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ytPBtidiQIlX6E9Qk1zXaLhf0aRP2ZAwNO3raa7DAvs',
      "accept": "application/json",
      "api_key": apiKeyAhmed,
    };

    final Uri uri = Uri.parse(
        'https://api.themoviedb.org/3/account/20637785/watchlist?session_id=f00791981152a1ed9e8ad4b51f3e344ea0b9cc31');

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 201) {
        // Successfully added to watchlist
        debugPrint('Movie deleted watchlist.');
      } else {
        // Handle errors here
        debugPrint(
            'Failed to delete movie from watchlist. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  static Future<PopularMoviesItems> getWatchlistMovies() async {
    // String apiUrl =
    //     'https://api.themoviedb.org/3/account/20637785/watchlist/movies';

    // final Map<String, String> headers = {
    //   'Content-Type': 'application/json',
    //   "Authorization":
    //       'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGU1MzRkNTcwYzhlYmUzMzNmZTNlNzY2N2JhZjY0MSIsInN1YiI6IjY1M2U0YWVkY2M5NjgzMDE0ZWI5YTFlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ytPBtidiQIlX6E9Qk1zXaLhf0aRP2ZAwNO3raa7DAvs',
    //   "accept": "application/json",
    //   "api_key": apiKeyAhmed,
    // };
    Uri url = Uri.https(baseUrl, "/3/account/20637785/watchlist/movies", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
      "language": "en-US",
      "page": '1',
      "session_id": "f00791981152a1ed9e8ad4b51f3e344ea0b9cc31",
      "sort_by": "created_at.asc",
    });

    // final Uri uri = Uri.parse(
    //     '$apiUrl?language=en-US&page=1&session_id=f00791981152a1ed9e8ad4b51f3e344ea0b9cc31&sort_by=created_at.asc');

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    debugPrint('${data.totalResults}');
    return data;
  }

  static Future<PopularMoviesItems> getCategories({required String catID}) async {
    Uri url = Uri.https(baseUrl, "/3/discover/movie", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
      "with_genres": catID
    });

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }

  static Future<bool> isBooked(int id) async {
    Uri url = Uri.https(baseUrl, "/3/account/20637785/watchlist/movies", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
      "language": "en-US",
      "page": '1',
      "session_id": "f00791981152a1ed9e8ad4b51f3e344ea0b9cc31",
      "sort_by": "created_at.asc",
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    bool isBookedd = data.results?.any((item) => item.id == id) ?? false;
    return isBookedd;
  }
}

    // Uri watchListUrl = Uri.https(
    //     baseUrl,
    //     "/3/account/20637785/watchlist/movies?language=en-US&page=1&session_id=f00791981152a1ed9e8ad4b51f3e344ea0b9cc31&sort_by=created_at.asc",
    //     {
    //       "Authorization":
    //           'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGU1MzRkNTcwYzhlYmUzMzNmZTNlNzY2N2JhZjY0MSIsInN1YiI6IjY1M2U0YWVkY2M5NjgzMDE0ZWI5YTFlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ytPBtidiQIlX6E9Qk1zXaLhf0aRP2ZAwNO3raa7DAvs',
    //       "api_key": apiKeyAhmed,
    //       "accept": "application/json",
    //     });
    // String apiUrl = 'api.themoviedb.org';
    // String language = 'en-US';
    // int page = 1;
    // String sessionId = 'f00791981152a1ed9e8ad4b51f3e344ea0b9cc31';
    // String sortBy = 'created_at.asc';
    // final Map<String, String> headers = {
    //   'Authorization':
    //       'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MGU1MzRkNTcwYzhlYmUzMzFmZTNlNzY2N2JhZjY0MSIsInN1YiI6IjY1M2U0YWVkY2M5NjgzMDE0ZWI5YTFlZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.ytPBtidiQIlX6E9Qk1zXaLhf0aRP2ZAwNO3raa7DAvs',
    //   'accept': 'application/json',
    // };
    // Uri uri = Uri.https(
    //     apiUrl,
    //     '/3/account/20637785/watchlist/movies?language=en-US&page=1&session_id=f00791981152a1ed9e8ad4b51f3e344ea0b9cc31&sort_by=created_at.asc',
    //     headers);