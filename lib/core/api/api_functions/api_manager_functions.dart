import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/constants.dart';

class ApiManager {
  static Future<PopularMoviesItems> getMovies({bool isPopular = true}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/popular", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyHatem
    });
    Uri url2 = Uri.https(baseUrl, "/3/movie/top_rated", {
      "Authorization": authorizationAccessToken,
      "language": "en-US",
      "api_key": apiKeyHatem,
      "accept": "application/json"
    });
    http.Response response = await http.get(isPopular ? url : url2);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }
}
