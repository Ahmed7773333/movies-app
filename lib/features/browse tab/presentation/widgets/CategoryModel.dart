import 'package:movies_app/core/utils/assets.dart';

class CategoryModel {
  String categoryName;
  String categoryImage;

  CategoryModel(this.categoryName, this.categoryImage);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel("Action", actionCat),
      CategoryModel("Crime", crimeCat),
      CategoryModel("Drama", dramaCat),
      CategoryModel("Comedy", comedyCat),
      CategoryModel("Horror", horrorCat),
      CategoryModel("Sci-Fi", sciFiCat2),
    ];
  }
}
