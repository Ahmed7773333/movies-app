// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/open_container.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/page.dart';

class SearchListItem extends StatelessWidget {
  final Results movie;
  const SearchListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget image = movie.posterPath != null
            ? Image.network(
                "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                fit: BoxFit.fill,
                height: 100,
                width: 80,
              )
            : Image.asset(
                logo,
                fit: BoxFit.fill,
                height: 100,
                width: 80,
              );
    return OpenContainers(
        closedWidget: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                      child: image),
                  const HorizontalSpace(5),
                  SizedBox(
                    width: 290.w,
                    height: 100.h,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movie.title ?? "???????????",
                            overflow: TextOverflow.ellipsis,
                            style: mediumText,
                          ),
                          const VerticalSpace(5),
                          Text(
                            movie.releaseDate ?? '?????????',
                            style: smallText2,
                          ),
                          const VerticalSpace(5)
                        ],
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
