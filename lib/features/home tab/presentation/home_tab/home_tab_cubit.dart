// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/home%20tab/domain/home_tab_repo.dart';

import '../../../../core/api/models/MovieDetailsItem.dart';
import '../../../../core/api/models/movie_item.dart';
part 'home_tab_state.dart';

class HomeTabCubit extends Cubit<HomeTabState> {
  HomeTabCubit(this.repo) : super(HomeTabInitial());
  HomeRepo repo;

  static HomeTabCubit get(context) => BlocProvider.of(context);
  List<Results> carouselList = [];
  List<Results> newReleaseList = [];
  List<Results> recomendedList = [];
  int runTime=0;

  Future<void> getAllLists() async {
    try {
      PopularMoviesItems data3 = await repo.getMovies(index: 3);
      emit(HomeLoadingState());
      PopularMoviesItems data2 = await repo.getMovies(index: 2);
      PopularMoviesItems data1 = await repo.getMovies(index: 1);

      carouselList = data1.results ?? [];
      newReleaseList = data2.results ?? [];
      recomendedList = data3.results ?? [];
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState());

      rethrow;
    }
  }

  Future<void> getMovieRuntime({required int id}) async {
    emit(HomeLoadingState());
    try {
      MovieDetailsItem data = await repo.getMovieRuntime(id: id);
      runTime = data.runtime ?? 0;
      emit(HomeSuccessState());
    } catch (e) {
      emit(HomeErrorState());

      rethrow;
    }
  }
}
