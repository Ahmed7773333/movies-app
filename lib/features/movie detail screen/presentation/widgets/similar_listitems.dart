import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/page.dart';
import '../../../../core/api/models/movie_item.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/components/open_container.dart';
import '../../../../core/utils/components/space.dart';
import '../../../../core/utils/styles.dart';

class SimilarListItem extends StatefulWidget {
  final Results movie;

  const SimilarListItem(this.movie, {super.key});

  @override
  State<SimilarListItem> createState() => _SimilarListItemState();
}

class _SimilarListItemState extends State<SimilarListItem> {
  bool isBooked = false;

  @override
  Widget build(BuildContext context) {
    return OpenContainers(
        closedWidget: Card(
          elevation: 20,
          shadowColor: navigationBarShadowColor,
          color: const Color(0xFF343534),
          child: SizedBox(
            height: 190.h, //184
            width: 97.w,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 122.74.h,
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}",
                        fit: BoxFit.fill,
                      ),
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
                      const VerticalSpace(1),
                      Expanded(
                          child: Text(
                            widget.movie.title ?? "",
                            style: smallText3,
                            maxLines: 2,
                          )),
                      const VerticalSpace(1),
                      Text(
                          widget.movie.releaseDate ?? //substring here, causes error in some movies
                              "".substring(0, 4),
                          style: verySmallText),
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
        ),
        openedWidget: MovieDetailsScreen(movie: widget.movie));
  }
}
