import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/utils/components/movie_item_cubit.dart/movie_item_repo.dart';

import '../../../api/models/movie_item.dart';
import '../../constants.dart';

class MovieItemRemote extends MovieItemRepo {
  @override
  Future<bool> isBooked(int id) async {
    Uri url = Uri.https(baseUrl, "/3/account/20637785/watchlist/movies", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
      "language": "en-US",
      "page": '1',
      "session_id": sessionId,
      "sort_by": "created_at.asc",
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    bool isBookedd = data.results?.any((item) => item.id == id) ?? false;
    return isBookedd;
  }

  @override
  Future<void> addToWatchlist(Results movie) async {
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
}
