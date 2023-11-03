import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/styles.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  const CategoryItem(this.name,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 25.h,
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFF514F4F)),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: smallText.copyWith(
            color: const Color(0xFFCBCBCB),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
