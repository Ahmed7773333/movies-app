import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/series_model.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/popular_series_item.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/components/space.dart';
import '../../../../../core/utils/styles.dart';

// ignore: must_be_immutable
class PopularSeriesList extends StatelessWidget {
  List<SeriesResults> resultsList;
  PopularSeriesList({required this.resultsList, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 184.h,
      color: listViewColor,
      child: Padding(
        padding: EdgeInsets.only(top: 13.h, left: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Popular Series",
              style: mediumText,
            ),
            const VerticalSpace(16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return PopularSeriesItem(movie: resultsList[index]);
                },
                itemCount: resultsList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
