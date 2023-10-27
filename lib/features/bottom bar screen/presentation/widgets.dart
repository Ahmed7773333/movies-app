import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavigationIcon extends StatelessWidget {
  final String icon;
  const NavigationIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(icon),
      size: 22.45.sp,
    );
  }
}
