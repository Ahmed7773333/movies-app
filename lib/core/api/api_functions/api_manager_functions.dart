import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/constants.dart';

import '../../utils/components/movie_item.dart';

class ApiManager {

  static Future<PopularMoviesItems> getMovies() async {
    Uri url = Uri.https(baseUrl, "/3/movie/popular", {
      "Authorization": authorizationAccessToken,
    });
    Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    PopularMoviesItems data= PopularMoviesItems.fromJson(jsonData);
    return data;
  }
}
