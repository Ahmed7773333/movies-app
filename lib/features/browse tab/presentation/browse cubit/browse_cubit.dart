import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/browse%20tab/domain/browse_tab_repo.dart';
import 'package:movies_app/features/browse%20tab/presentation/browse%20cubit/browse_state.dart';
import '../../../../core/api/models/api_category_model.dart';
import '../../../../core/api/models/movie_item.dart';

class BrowseCubit extends Cubit<BrowseStates> {
  BrowseCubit(this.repo) : super(BrowseInitState());
  BrowseRepo repo;
  static BrowseCubit get(context) => BlocProvider.of(context);

  List<Results> resultsList = [];
  bool view = false;
  Future<void> getCategories({required String catID}) async {
    emit(BrowseLoadingState());

    try {
      ApiCategoryModel data = await repo.getCategories(catID: catID);
      resultsList = data.results ?? [];
      emit(BrowseSuccessState());
    } catch (e) {
      emit(BrowseErrorState());
      rethrow;
    }
  }

  void changeView() {
    view = view == false ? true : false;
    emit(BrowseViewMoreState());
  }
}
