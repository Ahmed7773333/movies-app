import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/constants.dart';

class ApiManager {
  static Future<PopularMoviesItems> getMovies({int index=1}) async {
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
    http.Response response = await http.get(index==1?url:index==2?url2:url3);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }

  static Future<PopularMoviesItems> getMovieDetails({required int movie_id}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/${movie_id}", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyHatem,
      "id":movie_id
    });

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }

  static Future<PopularMoviesItems> getSimilarMovies({required int movie_id}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/${movie_id}/similar", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyHatem,
    });

    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    PopularMoviesItems data = PopularMoviesItems.fromJson(jsonData);
    return data;
  }
}
