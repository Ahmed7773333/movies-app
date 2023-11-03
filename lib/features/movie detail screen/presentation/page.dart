// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_functions/api_manager_functions.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/widgets/category_item.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/widgets/similar_listview.dart';
import '../../../core/api/models/movie_item.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/components/movie_item.dart';
import '../../../core/utils/styles.dart';
import '../../bottom bar screen/presentation/bottom_bar.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Results movie;

  MovieDetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          movie.title ?? '',
          style: tmpText.copyWith(
            fontSize: 20,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: ImageIcon(
            AssetImage(arrow),
            size: 20.5.sp,
            color: Colors.white,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, BottomBarScreen.routeName, (route) => false);
                },
                child: const Icon(Icons.home)),
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 217.h,
                width: double.infinity,
                child: Image.network(
                  movie.backdropPath != null
                      ? "https://image.tmdb.org/t/p/w500/${movie.backdropPath}"
                      : (movie.posterPath != null
                          ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}"
                          : logo),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: ImageIcon(
                  AssetImage(play),
                  size: 60.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const VerticalSpace(10),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(movie.title ?? "",
                    overflow: TextOverflow.ellipsis, style: largeText2),
                const VerticalSpace(8),
                Text(
                  movie.releaseDate?.substring(0, 4) ?? "",
                  style: verySmallText.copyWith(fontSize: 10),
                )
              ],
            ),
            // child: Row(
            //   children: [
            //
            //     // RichText(
            //     //   text: TextSpan(
            //     //     children: [
            //     //       // TextSpan(
            //     //       //   text: '${movie.title}\n',
            //     //       //   style: tmpText,
            //     //       // ),
            //     //       TextSpan(
            //     //         text: "\n${movie.releaseDate?.substring(0, 4)}",
            //     //         style: smallText,
            //     //       ),
            //     //     ],
            //     //   ),
            //     // ),
            //   ],
            // ),
          ),
          const VerticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: MovieItem(
                  height: 199,
                  width: 129,
                  image: movie.posterPath ?? logo,
                  movie: movie,
                ),
              ),
              const HorizontalSpace(11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220.w,
                      height: 25.h,
                      child: Row(
                        children: [
                          Expanded(
                            child: ListView.builder(
                                itemBuilder: (context, index) {
                                  List<String> genreNames =
                                      getGenreNames(movie.genreIds ?? []);
                                  return CategoryItem(genreNames[index]);
                                },
                                itemCount: movie.genreIds!.length <= 3
                                    ? movie.genreIds?.length
                                    : 3,
                                scrollDirection: Axis.horizontal),
                          )
                        ],
                      ),
                    ),
                    const VerticalSpace(6),
                    movie.genreIds!.length >= 4
                        ? SizedBox(
                            width: 220,
                            height: 25,
                            child: Expanded(
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    index += 3;
                                    List<String> genreNames =
                                        getGenreNames(movie.genreIds ?? []);
                                    return CategoryItem(genreNames[index]);
                                  },
                                  itemCount: movie.genreIds!.length - 3,
                                  scrollDirection: Axis.horizontal),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const VerticalSpace(10),
                    Text(
                      movie.overview ?? '',
                      maxLines: 7,
                      overflow: TextOverflow.ellipsis,
                      style: smallText.copyWith(
                        color: const Color(0xFFCBCBCB),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const VerticalSpace(20),
                    Row(
                      children: [
                        const HorizontalSpace(5),
                        Image.asset(
                          star,
                          width: 20.w,
                          height: 20.h,
                        ),
                        Text(
                          movie.voteAverage.toString(),
                          style: smallText.copyWith(fontSize: 16),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VerticalSpace(15),
          FutureBuilder(
            future: ApiManager.getSimilarMovies(id: movie.id ?? 0),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong!"));
              }
              List<Results> resultsList =
                  snapshot.data?.results!.toList() ?? [];
              return Expanded(child: SimilarListView(resultsList));
            },
          ),
          const VerticalSpace(28.6),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> genres = [
    {"id": 28, "name": "Action"},
    {"id": 12, "name": "Adventure"},
    {"id": 16, "name": "Animation"},
    {"id": 35, "name": "Comedy"},
    {"id": 80, "name": "Crime"},
    {"id": 99, "name": "Documentary"},
    {"id": 18, "name": "Drama"},
    {"id": 10751, "name": "Family"},
    {"id": 14, "name": "Fantasy"},
    {"id": 36, "name": "History"},
    {"id": 27, "name": "Horror"},
    {"id": 10402, "name": "Music"},
    {"id": 9648, "name": "Mystery"},
    {"id": 10749, "name": "Romance"},
    {"id": 878, "name": "Science Fiction"},
    {"id": 10770, "name": "TV Movie"},
    {"id": 53, "name": "Thriller"},
    {"id": 10752, "name": "War"},
    {"id": 37, "name": "Western"}
  ];

  List<String> getGenreNames(List<int> genreIds) {
    List<String> genreNames = [];
    for (int id in genreIds) {
      Map<String, dynamic>? genre = genres.firstWhere(
        (genre) => genre['id'] == id,
      );
      genreNames.add(genre['name'] as String);
    }
    return genreNames;
  }
}
