import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/movie%20detail%20screen/domain/movie_details_repo.dart';

import '../../../../core/api/models/MovieDetailsItem.dart';
import '../../../../core/api/models/movie_item.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit(this.repo) : super(MovieDetailsInitial());
  static MovieDetailsCubit get(context) => BlocProvider.of(context);
  MovieDeatailsRepo repo;
  List<Results> resultsList = [];
  int runTime=0;

  Future<void> getSimilarMovies({required int id}) async {
    emit(MovieDetailsILoading());
    try {
      PopularMoviesItems data = await repo.getSimilarMovies(id: id);
      resultsList = data.results ?? [];
      emit(MovieDetailsSucces());
    } catch (e) {
      emit(MovieDetailsError());

      rethrow;
    }
  }

  Future<void> getMoviesDetails({required int id}) async {
    emit(MovieDetailsILoading());
    try {
      MovieDetailsItem data = await repo.getMovieDetails(id: id);
      runTime = data.runtime ?? 0;
      emit(MovieDetailsSucces());
    } catch (e) {
      emit(MovieDetailsError());

      rethrow;
    }
  }
}
