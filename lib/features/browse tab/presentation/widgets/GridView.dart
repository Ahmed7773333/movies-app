import 'package:flutter/material.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/CategoryItem.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/CategoryModel.dart';

class GridViewCatItem extends StatelessWidget {
  List<CategoryModel> categories;

  GridViewCatItem(this.categories,{super.key,});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(5),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1.2,crossAxisSpacing: 30,),
      children: categories.map((cat) => InkWell(
          onTap: () {
          },
          child: CategoryItems(cat))).toList(),
    );
  }
}
