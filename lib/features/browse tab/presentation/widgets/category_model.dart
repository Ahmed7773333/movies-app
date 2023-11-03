// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movies_app/core/utils/assets.dart';

class CategoryModel {
  final String categoryName;
  final String categoryImage;
  // ignore: prefer_typing_uninitialized_variables
  final id;

  CategoryModel(this.categoryName, this.categoryImage, this.id);

  static List<CategoryModel> getCategories(bool viewMore) {
    if (viewMore) {
      return [
        CategoryModel("Action", actionCat, 28),
        CategoryModel("Adventure", adventureCat, 12),
        CategoryModel("Animation", animationCat, 16),
        CategoryModel("Comedy", comedyCat, 35),
        CategoryModel("Crime", crimeCat, 80),
        CategoryModel("Drama", dramaCat, 18),
        CategoryModel("Family", familyCat, 10751),
        CategoryModel("Fantasy", fantasyCat, 14),
        CategoryModel("History", historyCat, 36),
        CategoryModel("Horror", horrorCat, 27),
        CategoryModel("Mystery", mysteryCat, 9648),
        CategoryModel("Romance", romanceCat, 10749),
        CategoryModel("Science Fiction", sciFiCat2, 878),
        CategoryModel("Thriller", thrillerCat, 53),
        CategoryModel("War", warCat, 10752),
        CategoryModel("Western", westernCat, 37),
      ];
    } else {
      return [
        CategoryModel("Action", actionCat, 28),
        CategoryModel("Adventure", adventureCat, 12),
        CategoryModel("Animation", animationCat, 16),
        CategoryModel("Comedy", comedyCat, 35),
        CategoryModel("Crime", crimeCat, 80),
        CategoryModel("Drama", dramaCat, 18),
        CategoryModel("Family", familyCat, 10751),
        CategoryModel("Fantasy", fantasyCat, 14),
      ];
    }
  }
}
