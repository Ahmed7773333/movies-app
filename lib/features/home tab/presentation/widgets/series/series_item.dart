// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/api/models/series_model.dart';
import 'package:movies_app/core/utils/assets.dart';
import 'package:movies_app/core/utils/components/movie_item_cubit.dart/movie_item_cubit.dart';
import 'package:movies_app/core/utils/components/movie_item_cubit.dart/movie_item_remote.dart';

class SeriesItem extends StatelessWidget {
  const SeriesItem(
      {super.key,
        required this.height,
        required this.width,
        required this.series});
  final double height;
  final double width;
  final SeriesResults series;

  @override
  Widget build(BuildContext context) {
    final Widget image = series.posterPath != null
        ? Image.network(
      "https://image.tmdb.org/t/p/w500/${series.posterPath}",
      fit: BoxFit.fill,
      height: 100,
      width: 60,
    )
        : Image.asset(
      logo,
      fit: BoxFit.fill,
      height: 100,
      width: 60,
    );
    return BlocProvider(
      create: (context) =>
      MovieItemCubit(MovieItemRemote())..isBooked(series.id ?? 0),
      child: BlocConsumer<MovieItemCubit, MovieItemState>(
        listener: (context, state) {
          if (state is MovieItemIChecking) {
            debugPrint('checking...');
          } else if (state is MovieItemChecked) {
            debugPrint('checked...');
          } else if (state is MovieItemAdd) {
            debugPrint('Added...');
          } else if (state is MovieItemDelete) {
            debugPrint('Delted...');
          } else if (state is MovieItemChange) {
            MovieItemCubit.get(context).isBooked(series.id ?? 0);
            debugPrint('Changed...');
          }
        },
        builder: (context, state) {
          final bloc = MovieItemCubit.get(context);
          return Stack(
            children: [
              SizedBox(height: height.h, width: width.w, child: image),
              Positioned(
                left: 0,
                top: 0,
                child: InkWell(
                  onTap: () {
                    // if (!(bloc.isbooked)) {
                    //   bloc.addToWatchlist(series);
                    // } else {
                    //   bloc.deleteMovie(series);
                    // }
                  },
                  child: SizedBox(
                      width: 27.w,
                      height: 36.h,
                      child: Image.asset(bloc.isbooked ? booked : notBooked)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
