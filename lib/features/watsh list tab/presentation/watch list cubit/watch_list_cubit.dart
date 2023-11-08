import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/watsh%20list%20tab/domain/watch_list_repo.dart';

import '../../../../core/api/models/movie_item.dart';

part 'watch_list_state.dart';

class WatchListCubit extends Cubit<WatchListState> {
  WatchListCubit(this.repo) : super(WatchListInitial());
  WatchListRepo repo;
  static WatchListCubit get(context) => BlocProvider.of(context);
  List<Results> watchlList = [];
  Future<void> getWatchlistMovies() async {
    try {
      PopularMoviesItems data = await repo.getWatchlistMovies();
      emit(WatchListLoadingState());
      watchlList = data.results ?? [];

      emit(WatchListSuccessState());
    } catch (e) {
      emit(WatchListErrorState());
      rethrow;
    }
  }

  void deleteMovie(Results movie) {
    repo.deleteFromWatchlist(movie);

    emit(DeletedState());
    repo.deleteFromWatchlist(movie);

    emit(DeletedState());
  }
}
