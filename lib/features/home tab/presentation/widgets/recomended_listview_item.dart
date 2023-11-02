import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/app_colors.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/movie_item_cubit.dart/movie_item_cubit.dart';
import 'package:movies_app/core/utils/components/movie_item_cubit.dart/movie_item_remote.dart';
import 'package:movies_app/core/utils/components/open_container.dart';
import 'package:movies_app/core/utils/styles.dart';

import '../../../../core/utils/components/space.dart';
import '../../../movie detail screen/presentation/page.dart';

class RecommendedListViewItem extends StatelessWidget {
  final Results movie;

  const RecommendedListViewItem({Key? key, required this.movie})
      : super(key: key);

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
                        "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: -1,
                      top: -1,
                      child: BlocProvider(
                        create: (context) => MovieItemCubit(MovieItemRemote())
                          ..isBooked(movie.id ?? 0),
                        child: BlocConsumer<MovieItemCubit, MovieItemState>(
                          listener: (context, state) {
                            if (state is MovieItemIChecking) {
                              debugPrint('checking...');
                            } else if (state is MovieItemChecked) {
                              debugPrint('checked...');
                            } else if (state is MovieItemAdd) {
                              debugPrint('Added...');
                            } else if (state is MovieItemChange) {
                              MovieItemCubit.get(context)
                                  .isBooked(movie.id ?? 0);
                              debugPrint('Changed...');
                            }
                          },
                          builder: (context, state) {
                            final bloc = MovieItemCubit.get(context);

                            return InkWell(
                              onTap: () {
                                bloc.addToWatchlist(movie);
                              },
                              child: SizedBox(
                                  width: 27.w,
                                  height: 36.h,
                                  child: Image.asset(
                                      bloc.isbooked ? booked : notBooked)),
                            );
                          },
                        ),
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
                            movie.voteAverage.toString(),
                            style: smallText3,
                          ),
                          const Spacer(),
                        ],
                      ),
                      const VerticalSpace(1),
                      Expanded(
                          child: Text(
                        movie.title ?? "",
                        style: smallText3,
                        maxLines: 2,
                      )),
                      const VerticalSpace(1),
                      Text(
                          movie.releaseDate?.substring(0, 4) ??
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
        openedWidget: MovieDetailsScreen(movie: movie));
  }
}
