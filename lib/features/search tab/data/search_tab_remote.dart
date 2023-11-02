import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_item.dart';

import '../../../core/utils/constants.dart';
import '../domain/search_tab_repo.dart';

class SearchRemote extends SearchRepo {
  @override
  Future<PopularMoviesItems> getMovies(String q) async {
    Uri searchUrl = Uri.https(baseUrl, "/3/search/movie", {
      "Authorization": authorizationAccessToken,
      "language": 'en',
      "api_key": apiKeyAhmed,
      "accept": "application/json",
      "query": q,
    });

    http.Response response = await http.get(searchUrl);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }
}
