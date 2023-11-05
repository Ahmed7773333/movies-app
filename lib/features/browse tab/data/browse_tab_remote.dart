import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/api/models/api_category_model.dart';
import '../../../core/utils/constants.dart';
import '../domain/browse_tab_repo.dart';

class BrowseRemote extends BrowseRepo {
  @override
  Future<ApiCategoryModel> getCategories({required String catID}) async {
    Uri url = Uri.https(baseUrl, "/3/discover/movie", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
      "with_genres": catID
    });
    http.Response response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    ApiCategoryModel data = ApiCategoryModel.fromJson(jsonData);
    return data;
  }
}
