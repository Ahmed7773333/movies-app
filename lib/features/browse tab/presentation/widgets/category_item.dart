import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/category_model.dart';

class CategoryItems extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItems(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 158.w,
      height: 150.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                categoryModel.categoryImage,
                fit: BoxFit.contain,
              )),
          Text(categoryModel.categoryName, style: mediumText2),
        ],
      ),
    );
  }
}
