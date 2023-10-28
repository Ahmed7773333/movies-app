// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/utils/assets.dart';

class MovieItem extends StatefulWidget {
  final double height;
  final double width;
  const MovieItem({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  State<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: widget.height.h,
          width: widget.width.w,
          child: Image.asset(
            bigTemp,
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: InkWell(
            onTap: () {
              isBooked = isBooked == false ? true : false;
              setState(() {});
            },
            child: SizedBox(
                width: 27.w,
                height: 36.h,
                child: Image.asset(isBooked ? booked : notBooked)),
          ),
        ),
      ],
    );
  }
}
