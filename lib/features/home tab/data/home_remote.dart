import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/features/home%20tab/domain/home_tab_repo.dart';

import '../../../core/utils/constants.dart';

class HomeRemote extends HomeRepo {
  @override
  Future<PopularMoviesItems> getMovies(
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

    http.Response response = await http.get(index == 1
        ? url
        : index == 2
            ? url2
            : url3);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }
}
