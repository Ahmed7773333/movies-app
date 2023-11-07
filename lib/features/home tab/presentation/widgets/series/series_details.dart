// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/series_category_item.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/series_item.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/similar_series_list.dart';
import 'package:movies_app/features/movie%20detail%20screen/data/movie_deatils_remote.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/movie_details/movie_details_cubit.dart';
import '../../../../../core/api/models/series_model.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../bottom bar screen/presentation/bottom_bar.dart';
import '../../../../movie detail screen/presentation/widgets/category_item.dart';

class SeriesDetails extends StatelessWidget {
  final SeriesResults series;

  SeriesDetails({
    Key? key,
    required this.series,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget image = series.backdropPath != null
        ? Image.network(
            "https://image.tmdb.org/t/p/w500/${series.backdropPath}",
            fit: BoxFit.fill,
          )
        : series.posterPath != null
            ? Image.network(
                "https://image.tmdb.org/t/p/w500/${series.posterPath}",
                fit: BoxFit.fill,
              )
            : Image.asset(
                logo,
                fit: BoxFit.fill,
              );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          series.name ?? '',
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
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(
            children: [
              SizedBox(height: 217.h, width: double.infinity, child: image),
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
                Text(series.name ?? "",
                    overflow: TextOverflow.ellipsis, style: largeText2),
                const VerticalSpace(8),
                Text(
                  series.firstAirDate?.substring(0, 4) ?? "",
                  style: verySmallText.copyWith(fontSize: 10),
                )
              ],
            ),
          ),
          const VerticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: SeriesItem(
                  height: 199,
                  width: 129,
                  series: series,
                ),
              ),
              const HorizontalSpace(15),
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
                                      getGenreNames(series.genreIds ?? []);
                                  return CategoryItem(genreNames[index]);
                                },
                                itemCount: series.genreIds!.length <= 3
                                    ? series.genreIds?.length
                                    : 3,
                                scrollDirection: Axis.horizontal),
                          )
                        ],
                      ),
                    ),
                    const VerticalSpace(6),
                    series.genreIds!.length >= 4
                        ? SizedBox(
                            width: 220,
                            height: 25,
                            child: Expanded(
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    index += 3;
                                    List<String> genreNames =
                                        getGenreNames(series.genreIds ?? []);
                                    return SeriesCategoryItem(
                                        genreNames[index]);
                                  },
                                  itemCount: series.genreIds!.length - 3,
                                  scrollDirection: Axis.horizontal),
                            ),
                          )
                        : const SizedBox.shrink(),
                    const VerticalSpace(5),
                    Text(
                      series.overview ?? '',
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
                        const HorizontalSpace(5),
                        Text(
                          series.voteAverage.toString(),
                          style: smallText.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const VerticalSpace(15),
          BlocProvider(
            create: (context) => MovieDetailsCubit(MovieDetailsRemote())
              ..getSimilarSeriesMovies(id: series.id ?? 802),
            child: BlocConsumer<MovieDetailsCubit, MovieDetailsState>(
              listener: (context, state) {
                if (state is MovieDetailsILoading) {
                  debugPrint('loading...');
                } else if (state is MovieDetailsError) {
                  debugPrint('error...');
                } else if (state is MovieDetailsSucces) {
                  debugPrint('working...');
                }
              },
              builder: (context, state) {
                return SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: SimilarSeriesList(
                      MovieDetailsCubit.get(context).seriesResultsList),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Map<String, dynamic>> genres = [
    {"id": 10759, "name": "Adventure"},
    {"id": 16, "name": "Animation"},
    {"id": 35, "name": "Comedy"},
    {"id": 80, "name": "Crime"},
    {"id": 99, "name": "Documentary"},
    {"id": 18, "name": "Drama"},
    {"id": 10751, "name": "Family"},
    {"id": 10762, "name": "Kids"},
    {"id": 9648, "name": "Mystery"},
    {"id": 10763, "name": "News"},
    {"id": 10764, "name": "Reality"},
    {"id": 10765, "name": "Fantasy"},
    {"id": 10766, "name": "Soap"},
    {"id": 10767, "name": "Talk"},
    {"id": 10768, "name": "War"},
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
