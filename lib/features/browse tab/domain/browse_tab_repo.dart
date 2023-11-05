import '../../../core/api/models/api_category_model.dart';

abstract class BrowseRepo {
  Future<ApiCategoryModel> getCategories({required String catID});
}
