// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/components/open_container.dart';
import '../../../movie detail screen/presentation/page.dart';

class WatchListItem extends StatelessWidget {
  final Results movie;
  final VoidCallback onTapp;
  const WatchListItem({
    Key? key,
    required this.movie,
    required this.onTapp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget image = movie.posterPath != null
            ? Image.network(
                "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                fit: BoxFit.fill,
              )
            : Image.asset(
                logo,
                fit: BoxFit.fill,
              );
    return OpenContainers(
        closedWidget: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 110.w,
                        height: 110.h,
                        child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            child: image),
                      ),
                      Positioned(
                          left: 0,
                          top: 0,
                          child: InkWell(
                            onTap: onTapp,
                            child: SizedBox(
                                width: 27.w,
                                height: 36.h,
                                child: Image.asset(booked)),
                          ))
                    ],
                  ),
                  const HorizontalSpace(5),
                  Expanded(
                    child: SizedBox(
                      width: 220,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: mediumText,
                            ),
                            const VerticalSpace(5),
                            Text(
                              movie.releaseDate?.substring(0, 4) ?? '',
                              style: smallText2,
                            ),
                            const VerticalSpace(5)
                          ],
                        ),
                      ),
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
        ),
        openedWidget: MovieDetailsScreen(movie: movie));
  }
}
