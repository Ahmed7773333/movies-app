import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/open_container.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/page.dart';

class FirstListViewItem extends StatefulWidget {
  final String image;
  const FirstListViewItem({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<FirstListViewItem> createState() => _FirstListViewItemState();
}

class _FirstListViewItemState extends State<FirstListViewItem> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OpenContainers(
            closedWidget: SizedBox(
              width: 96.87.w,
              height: 127.74.h,
              child: Image.asset(widget.image),
            ),
            openedWidget: const MovieDetailsScreen()),
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
            ))
      ],
    );
  }
}
