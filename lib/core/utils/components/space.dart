import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalSpace extends StatelessWidget {
  final double hight;
  const VerticalSpace(this.hight, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: hight.h,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  final double width;
  const HorizontalSpace(this.width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}
