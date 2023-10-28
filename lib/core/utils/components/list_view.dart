// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';

import '../app_colors.dart';

class HorizontalListView extends StatelessWidget {
  final double hight;
  final List<dynamic> list;
  final String text;
  const HorizontalListView({
    Key? key,
    required this.hight,
    required this.list,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: hight.h,
      color: listViewColor,
      child: Padding(
        padding: EdgeInsets.only(top: 13.h, left: 13.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: smallText.copyWith(fontSize: 15),
            ),
            const VerticalSpace(16),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return list[index];
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
