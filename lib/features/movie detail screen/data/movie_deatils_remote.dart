import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_app/core/api/models/movie_details_item.dart';
import 'package:movies_app/core/api/models/series_model.dart';
import 'package:movies_app/features/movie%20detail%20screen/domain/movie_details_repo.dart';
import '../../../core/api/models/movie_item.dart';
import '../../../core/utils/constants.dart';

class MovieDetailsRemote extends MovieDeatailsRepo {
  @override
  Future<PopularMoviesItems> getSimilarMovies({required int id}) async {
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

  @override
  Future<MovieDetailsItem> getMovieDetails({required int id}) async {
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
  Future<SeriesModel> getSimilarSeriesMovies({required int id}) async{
    Uri url = Uri.https(baseUrl, "/3/tv/$id/similar", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    SeriesModel data = SeriesModel.fromJson(jsonData);
    return data;
  }

}
