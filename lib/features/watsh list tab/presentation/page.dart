import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/watsh%20list%20tab/presentation/widgets./WatchListItem.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 80.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "WatchList",
              style: largeText,
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return WatchListItem();
              },itemCount: 7,),
            ),
          ],
        )
      )
    );
  }
}
