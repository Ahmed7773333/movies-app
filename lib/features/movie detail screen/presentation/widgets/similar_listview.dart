import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/widgets/similar_listitems.dart';
import '../../../../core/api/api_functions/api_manager_functions.dart';
import '../../../../core/api/models/movie_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/components/space.dart';
import '../../../../core/utils/styles.dart';

class SimilarListView extends StatefulWidget {
  final List<Results> resultsList;

  const SimilarListView(this.resultsList, {super.key});

  @override
  State<SimilarListView> createState() => _SimilarListViewState();
}

class _SimilarListViewState extends State<SimilarListView> {
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
          children: [
            Text(
              "More Like This",
              style: smallText.copyWith(fontSize: 15),
            ),
            const VerticalSpace(16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SimilarListItem(widget.resultsList[index]);
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
