import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/constants.dart';

class ApiManager {
  static Future<PopularMoviesItems> getMovies(
      {int index = 1,
      String q = '',
      String year = '2023',
      String language = 'en'}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/popular", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyHatem
    });
    Uri url2 = Uri.https(baseUrl, "/3/movie/upcoming", {
      "Authorization": authorizationAccessToken,
      "language": "en-US",
      "api_key": apiKeyHatem,
      "accept": "application/json"
    });

    Uri url3 = Uri.https(baseUrl, "/3/movie/top_rated", {
      "Authorization": authorizationAccessToken,
      "language": "en-US",
      "api_key": apiKeyHatem,
      "accept": "application/json"
    });
    Uri searchUrl = Uri.https(baseUrl, "/3/search/movie", {
      "Authorization": authorizationAccessToken,
      "language": language,
      "api_key": apiKeyHatem,
      "accept": "application/json",
      "query": q,
      "primary_release_year": year,
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
}
