// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/api_functions/api_manager_functions.dart';

import 'package:movies_app/core/utils/components/space.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/widgets/category_item.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/widgets/similar_listitems.dart';
import 'package:movies_app/features/movie%20detail%20screen/presentation/widgets/similar_listview.dart';

import '../../../core/api/models/movie_item.dart';
import '../../../core/utils/assets.dart';
import '../../../core/utils/components/movie_item.dart';
import '../../../core/utils/styles.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Results movie;
  const MovieDetailsScreen({
    Key? key,
    required this.movie,
  }) : super(key: key);
  // List<SecondListViewItem> secondList = [
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  //   SecondListViewItem(image: bigTemp),
  // ];
  @override
  Widget build(BuildContext context) {
    Future<PopularMoviesItems> movieDetails= ApiManager.getMovieDetails(movie_id: movie.id??0);
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
      ),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 217.h,
                width: double.infinity,
                child: Image.network(
                  "https://image.tmdb.org/t/p/w500/${movie.backdropPath}",
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
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: '${movie.title}\n', style: tmpText),
                TextSpan(
                  text: "${movie.releaseDate?.substring(0,4)}",
                  style: smallText,
                ),
              ],
            ),
          ),
          const VerticalSpace(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MovieItem(height: 199, width: 129,image: movie.posterPath??""),
              const HorizontalSpace(11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        CategoryItem(),
                        HorizontalSpace(9),
                        CategoryItem(),
                        HorizontalSpace(9),
                        CategoryItem(),
                      ],
                    ),
                    const VerticalSpace(3),
                    Padding(
                      padding: EdgeInsets.only(right: 210.w),
                      child: const CategoryItem(),
                    ),
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
                          movie.voteAverage.toString().substring(0,4),
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
          const VerticalSpace(18),
          FutureBuilder(future: ApiManager.getSimilarMovies(movie_id: movie.id??0),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return const Center(child: Text("Something went wrong!"));
              }
              List<Results> resultsList = snapshot.data?.results!.toList() ?? [];
              return Expanded(
                  child: SimilarListView(resultsList));
            },
          ),
          const VerticalSpace(28.6),
        ],
      ),
    );
  }
}
