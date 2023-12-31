import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/browse%20tab/presentation/widgets/category_model.dart';

import '../../../../core/utils/components/open_container.dart';
import 'category_id_listview.dart';

class CategoryItems extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryItems(this.categoryModel, {super.key});

  @override
  Widget build(BuildContext context) {
    return OpenContainers(
      closedWidget: SizedBox(
        width: 158.w,
        height: 150.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 158.w,
              height: 90.h,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  child: Image.asset(
                    categoryModel.categoryImage,
                    fit: BoxFit.fill,
                  )),
            ),
            Text(categoryModel.categoryName, style: mediumText2),
          ],
        ),
      ),
      openedWidget: CatgeorytIdListview(
          cat: categoryModel.categoryName, id: categoryModel.id),
    );
  }
}
