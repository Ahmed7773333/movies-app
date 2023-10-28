import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';

import 'widgets/watch_listItem.dart';

class WatchListTab extends StatelessWidget {
  const WatchListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 80.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "WatchList",
                  style: largeText,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return const WatchListItem();
                    },
                    itemCount: 7,
                  ),
                ),
              ],
            )));
  }
}
