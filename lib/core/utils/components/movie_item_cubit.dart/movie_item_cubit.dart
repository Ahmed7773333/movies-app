import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/components/movie_item_cubit.dart/movie_item_repo.dart';

import '../../../api/models/movie_item.dart';

part 'movie_item_state.dart';

class MovieItemCubit extends Cubit<MovieItemState> {
  MovieItemCubit(this.repo) : super(MovieItemInitial());
  MovieItemRepo repo;
  static MovieItemCubit get(context) => BlocProvider.of(context);
  bool isbooked = false;
  Future<void> isBooked(int id) async {
    emit(MovieItemIChecking());
    isbooked = await repo.isBooked(id);
    emit(MovieItemChecked());
  }

  Future<void> addToWatchlist(Results movie) async {
    emit(MovieItemAdd());
    await repo.addToWatchlist(movie);
    emit(MovieItemChange());
  }

  Future<void> deleteMovie(Results movie) async {
    repo.deleteFromWatchlist(movie);

    emit(MovieItemDelete());
    repo.deleteFromWatchlist(movie);

    emit(MovieItemDelete());
    emit(MovieItemChange());
  }
}
