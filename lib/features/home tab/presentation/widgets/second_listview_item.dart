import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/styles.dart';
import '../../../../core/utils/components/space.dart';

class SecondListViewItem extends StatefulWidget {
  final String image;
  Results movie;
  SecondListViewItem({
    Key? key,
    required this.image,
    required this.movie
  }) : super(key: key);

  @override
  State<SecondListViewItem> createState() => _SecondListViewItemState();
}

class _SecondListViewItemState extends State<SecondListViewItem> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: navigationBarShadowColor,
      color: const Color(0xFF343534),
      child: SizedBox(
        height: 200.h, //184
        width: 97.w,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 96.87.w,
                  height: 127.74.h,
                  child: Image.asset(widget.image),
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
            ),
            const VerticalSpace(7),
            SizedBox(
              height: 58.h,
              width: 96.87,
              child: Padding(
                padding: EdgeInsets.all(5.sp),
                child: Column(children: [
                  Row(
                    children: [
                      const HorizontalSpace(6),
                      Image.asset(
                        star,
                        width: 10.w,
                        height: 9.h,
                      ),
                      Text(
                        widget.movie.voteAverage.toString(),
                        style: smallText,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const VerticalSpace(1),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(text: widget.movie.title, style: smallText),
                        TextSpan(
                          text: "   ${widget.movie.releaseDate?.substring(0,4)}",
                          style: smallText.copyWith(fontSize: 8.sp),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
