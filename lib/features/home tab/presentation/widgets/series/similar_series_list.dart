import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/series_model.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/similar_series_item.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/components/space.dart';
import '../../../../../core/utils/styles.dart';

class SimilarSeriesList extends StatefulWidget {
  final List<SeriesResults> resultsList;

  const SimilarSeriesList(this.resultsList, {super.key});

  @override
  State<SimilarSeriesList> createState() => _SimilarSeriesListState();
}

class _SimilarSeriesListState extends State<SimilarSeriesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 184.h,
      color: listViewColor,
      child: Padding(
        padding: EdgeInsets.only(top: 6.h, left: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "More Like This",
              style: smallText.copyWith(fontSize: 15),
            ),
            const VerticalSpace(8),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SimilarSeriesItem(widget.resultsList[index]);
                },
                itemCount: widget.resultsList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
