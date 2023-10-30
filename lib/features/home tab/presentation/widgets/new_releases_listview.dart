import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/api_functions/api_manager_functions.dart';
import '../../../../core/api/models/movie_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/components/space.dart';
import '../../../../core/utils/styles.dart';
import 'first_listview_item.dart';

// ignore: must_be_immutable
class NewReleasesListView extends StatelessWidget {
  List<Results> resultsList;
  NewReleasesListView({required this.resultsList, super.key});

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
              "New Releases",
              style: mediumText,
            ),
            const VerticalSpace(16),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return NewReleasesListViewItem(movie: resultsList[index]);
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
