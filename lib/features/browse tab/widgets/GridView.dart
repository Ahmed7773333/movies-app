import 'package:flutter/material.dart';
import 'package:movies_app/features/browse%20tab/widgets/CategoryModel.dart';

import '../../movie detail screen/presentation/widgets/category_item.dart';


class GridViewCatItem extends StatelessWidget {
  List<CategoryModel> categories;

  GridViewCatItem(this.categories,{super.key,});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 1,crossAxisSpacing: 20,mainAxisSpacing: 20),
      children: categories.map((cat) => InkWell(
          onTap: () {
          },
          child: CategoryItem())).toList(),
    );
  }
}
