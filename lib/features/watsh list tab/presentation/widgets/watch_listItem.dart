// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';

import '../../../../core/api/api_functions/api_manager_functions.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/components/open_container.dart';
import '../../../movie detail screen/presentation/page.dart';

class WatchListItem extends StatefulWidget {
  final Results movie;
  const WatchListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<WatchListItem> createState() => _WatchListItemState();
}

class _WatchListItemState extends State<WatchListItem> {
  @override
  Widget build(BuildContext context) {
    return OpenContainers(
        closedWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: 96.87.w,
                      height: 100.74.h,
                      child: Image.network(
                          "https://image.tmdb.org/t/p/w500/${widget.movie.posterPath}"),
                    ),
                    Positioned(
                        left: 0,
                        top: 0,
                        child: InkWell(
                          onTap: () {
                            ApiManager.deleteFromWatchlist(widget.movie);
                            debugPrint('working');
                            setState(() {});
                          },
                          child: SizedBox(
                              width: 27.w,
                              height: 36.h,
                              child: Image.asset(booked)),
                        ))
                  ],
                ),
                const HorizontalSpace(5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(text: TextSpan(text: widget.movie.title ?? "")),
                      const VerticalSpace(5),
                      Text(
                        widget.movie.releaseDate ?? '',
                        style: smallText2,
                      ),
                      const VerticalSpace(5)
                    ],
                  ),
                )
              ],
            ),
            const VerticalSpace(15),
            Divider(
              color: Colors.white,
              indent: 20.5.w,
              endIndent: 33.5.w,
              height: 1,
            ),
            const VerticalSpace(25),
          ],
        ),
        openedWidget: MovieDetailsScreen(movie: widget.movie));
  }
}
