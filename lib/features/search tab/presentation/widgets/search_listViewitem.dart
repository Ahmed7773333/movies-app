// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/api/models/movie_item.dart';
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
    return OpenContainers(
        closedWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Image.network(
                    "https://image.tmdb.org/t/p/w500/${movie.posterPath}",
                    fit: BoxFit.fill,
                    height: 100,
                    width: 60,
                  ),
                ),
                const HorizontalSpace(5),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title ?? '',
                        style: mediumText,
                      ),
                      const VerticalSpace(5),
                      Text(
                        movie.releaseDate ?? '',
                        style: smallText2,
                      ),
                      const VerticalSpace(5),
                      Text(movie.originalTitle ?? '',
                          style: smallText2, overflow: TextOverflow.ellipsis),
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
        openedWidget: MovieDetailsScreen(movie: movie));
  }
}
