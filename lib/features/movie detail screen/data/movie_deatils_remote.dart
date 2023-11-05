import 'dart:convert';

import 'package:http/http.dart' as http;
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
}
