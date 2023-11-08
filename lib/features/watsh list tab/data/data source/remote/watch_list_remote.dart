import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/constants.dart';
import 'package:movies_app/features/watsh%20list%20tab/domain/watch_list_repo.dart';

class WatchListRemote extends WatchListRepo {
  @override
  Future<PopularMoviesItems> getWatchlistMovies() async {
    Uri url = Uri.https(baseUrl, "/3/account/20637785/watchlist/movies", {
      "Authorization": authorizationAccessToken,
      "api_key": apiKeyAhmed,
      "session_id": sessionId,
    });

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    debugPrint('${data.results?.length ?? 'jjjjjjjj'}');
    return data;
  }

  @override
  Future<void> deleteFromWatchlist(Results movie) async {
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
}
