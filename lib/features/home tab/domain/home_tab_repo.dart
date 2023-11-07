import '../../../core/api/models/movie_details_item.dart';
import '../../../core/api/models/series_model.dart';
import '../../../core/api/models/movie_item.dart';

abstract class HomeRepo {
  Future<PopularMoviesItems> getMovies(
      {int index = 1, String q = '', String language = 'en'});

  Future<MovieDetailsItem> getMovieRuntime({required int id});

  Future<SeriesModel> getSeries({int index=1, String language= "en"});
}
