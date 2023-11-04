import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies_app/features/browse%20tab/presentation/browse%20cubit/browse_state.dart';
import '../../../../core/api/models/api_category_model.dart';
import '../../../../core/api/models/movie_item.dart';
import '../../../../core/utils/constants.dart';

class BrowseCubit extends Cubit<BrowseStates> {
  BrowseCubit() : super(BrowseInitState());

  static BrowseCubit get(context) => BlocProvider.of(context);

  List<Results> resultsList=[];

  Future<void> getCategories({required String catID}) async {
    emit(BrowseGetCategoriesLoadingState());

    Uri url = Uri.https(baseUrl, "/3/discover/movie", {
      "Authorization": authorizationAccessToken,
      "accept": "application/json",
      "api_key": apiKeyAhmed,
      "with_genres": catID
    });
    http.Response response = await http.get(url);
    try{
      var jsonData = jsonDecode(response.body);
      ApiCategoryModel data = ApiCategoryModel.fromJson(jsonData);
      resultsList=  data.results??[];
      emit(BrowseGetCategoriesSuccessState());
    }catch(e){
      emit(BrowseGetCategoriesErrorState());
      throw e;
    }
  }
}
