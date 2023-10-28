import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/category_model.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/grid_view.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = CategoryModel.getCategories();
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Browse Category",
            style: largeText,
          ),
          Expanded(child: GridViewCatItem(categories)),
        ],
      ),
    ));
  }
}
