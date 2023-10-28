import 'package:movies_app/core/utils/assets.dart';

class CategoryModel {
  String categoryName;
  String categoryImage;

  CategoryModel(this.categoryName, this.categoryImage);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel("Action", actionCat),
      CategoryModel("Crime", actionCat),
      CategoryModel("Drama", actionCat),
      CategoryModel("Comedy", actionCat),
      CategoryModel("Horror", actionCat),
      CategoryModel("Sci-Fi", actionCat),
    ];
  }
}
