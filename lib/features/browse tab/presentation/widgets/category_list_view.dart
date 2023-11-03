// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/open_container.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/core/utils/styles.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/page.dart';

class CategoryListItem extends StatelessWidget {
  final Results movie;
  const CategoryListItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(
                      movie.posterPath != null
                          ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}"
                          : logo,
                      fit: BoxFit.fill,
                      height: 100,
                      width: 60,
                    ),
                  ),
                  const HorizontalSpace(5),
                  SizedBox(
                    width: 300.w,
                    height: 100.h,
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
                            movie.releaseDate ?? '',
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
