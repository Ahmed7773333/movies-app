import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/styles.dart';
import '../../../../core/utils/components/space.dart';

class RecommendedListViewItem extends StatefulWidget {
  Results movie;
  RecommendedListViewItem({Key? key,required this.movie})
      : super(key: key);

  @override
  State<RecommendedListViewItem> createState() => _RecommendedListViewItemState();
}

class _RecommendedListViewItemState extends State<RecommendedListViewItem> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shadowColor: navigationBarShadowColor,
      color: const Color(0xFF343534),
      child: SizedBox(
        height: 184.h, //184
        width: 97.w,
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 127.74.h,
                  child: Image.network("https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}",fit: BoxFit.fill,),
                ),
                Positioned(
                  left: -1,
                  top: -1,
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
            SizedBox(
              height: 58.h,
              width: 96.87,
              child: Padding(
                padding: EdgeInsets.all(5.sp),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const HorizontalSpace(6),
                      Image.asset(
                        star,
                        width: 10.w,
                        height: 9.h,
                      ),
                      const HorizontalSpace(5),
                      Text(
                        widget.movie.voteAverage.toString(),
                        style: smallText3,
                      ),
                      const Spacer(),
                    ],
                  ),
                  VerticalSpace(1),
                  Expanded(child: Text(widget.movie.title??"", style: smallText3,maxLines: 2,overflow: TextOverflow.ellipsis,)),
                  VerticalSpace(1),
                  Text(widget.movie.releaseDate?.substring(0,4)??"".substring(0,4), style: verySmallText),
                  // RichText(
                  //   text: TextSpan(
                  //     children: [
                  //       TextSpan(text: widget.movie.title, style: smallText3,),
                  //       TextSpan(
                  //         text:
                  //             "\n${widget.movie.releaseDate?.substring(0, 4)}",
                  //         style: verySmallText,
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
