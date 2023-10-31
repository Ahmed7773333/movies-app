// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app/core/utils/assets.dart';

class CategoryModel {
  final String categoryName;
  final String categoryImage;
  final int id;

  CategoryModel(this.categoryName, this.categoryImage, this.id);

  static List<CategoryModel> getCategories() {
    return [
      CategoryModel("Action", actionCat, 385687),
      CategoryModel("Crime", crimeCat, 238),
      CategoryModel("Drama", dramaCat, 87359),
      CategoryModel("Comedy", comedyCat, 87359),
      CategoryModel("Horror", horrorCat, 1024773),
      CategoryModel("Sci-Fi", sciFiCat2, 87359),
    ];
  }
}
