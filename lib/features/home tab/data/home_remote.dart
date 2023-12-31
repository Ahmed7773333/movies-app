import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_details_item.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/features/home%20tab/domain/home_tab_repo.dart';

import '../../../core/api/models/series_model.dart';
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

  @override
  Future<MovieDetailsItem> getMovieRuntime({required int id}) async {
    Uri url = Uri.https(baseUrl, "/3/movie/$id", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    MovieDetailsItem data = MovieDetailsItem.fromJson(jsonData);
    return data;
  }

  @override
  Future<SeriesModel> getSeries({int index = 1, String language = "en"}) async{
    Uri url = Uri.https(baseUrl, "/3/tv/popular", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed
    });
    Uri url2 = Uri.https(baseUrl, "/3/tv/top_rated", {
      "Authorization": authorizationAccessToken,
      "language": "en-US",
      "api_key": apiKeyAhmed,
      "accept": "application/json"
    });

    http.Response response = await http.get(index == 1
        ? url
        : url2);
    var jsonData = jsonDecode(response.body);
    SeriesModel data = SeriesModel.fromJson(jsonData);
    return data;
  }
}
