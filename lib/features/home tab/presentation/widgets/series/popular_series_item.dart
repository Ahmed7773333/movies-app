import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/series_model.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/open_container.dart';
import 'package:movies_app/features/home%20tab/presentation/widgets/series/series_movie_details.dart';
import '../../../../../core/utils/components/movie_item_cubit.dart/movie_item_cubit.dart';
import '../../../../../core/utils/components/movie_item_cubit.dart/movie_item_remote.dart';

// ignore: must_be_immutable
class PopularSeriesItem extends StatelessWidget {
  SeriesResults movie;
  PopularSeriesItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        OpenContainers(
            closedWidget: SizedBox(
              width: 96.87.w,
              height: 127.74.h,
              child: Image.network(movie.posterPath != null
                  ? "https://image.tmdb.org/t/p/w500/${movie.posterPath}"
                  : logo),
            ),
            openedWidget: SeriesDetails(series: movie,)),
        Positioned(
          left: 0,
          top: 0,
          child: BlocProvider(
            create: (context) =>
            MovieItemCubit(MovieItemRemote())..isBooked(movie.id ?? 0),
            child: BlocConsumer<MovieItemCubit, MovieItemState>(
              listener: (context, state) {
                if (state is MovieItemIChecking) {
                  debugPrint('checking...');
                } else if (state is MovieItemChecked) {
                  debugPrint('checked...');
                } else if (state is MovieItemAdd) {
                  debugPrint('Added...');
                } else if (state is MovieItemChange) {
                  MovieItemCubit.get(context).isBooked(movie.id ?? 0);
                  debugPrint('Changed...');
                }
              },
              builder: (context, state) {
                final bloc = MovieItemCubit.get(context);

                return InkWell(
                  onTap: () {
                    // if (!(bloc.isbooked)) {
                    //   bloc.addToWatchlist(movie);
                    // } else {
                    //   bloc.deleteMovie(movie);
                    // }
                  },
                  child: SizedBox(
                      width: 27.w,
                      height: 36.h,
                      child: Image.asset(bloc.isbooked ? booked : notBooked)),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
