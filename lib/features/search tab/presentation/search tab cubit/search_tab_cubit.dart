import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/api/models/movie_item.dart';
import 'package:movies_app/features/search%20tab/domain/search_tab_repo.dart';

part 'search_tab_state.dart';

class SearchTabCubit extends Cubit<SearchTabState> {
  SearchTabCubit(
    this.repo,
  ) : super(SearchTabInitial());

  SearchRepo repo;

  static SearchTabCubit get(context) => BlocProvider.of(context);
  List<Results> searchlList = [];
  final TextEditingController searchController = TextEditingController();

  Future<void> getSearchlList(String q) async {
    emit(SearchListLoadingState());
    try {
      PopularMoviesItems data = await repo.getMovies(q);
      searchlList = data.results ?? [];
      emit(SearchListSuccessState());
    } catch (e) {
      emit(SearchListErrorState());
      rethrow;
    }
  }

  void submit() {
    searchController.text = searchController.text;
    debugPrint(searchController.text);
    emit(SearchKeyWordState());
  }
}
