import '../../../core/api/models/movie_item.dart';

abstract class HomeRepo {
  Future<PopularMoviesItems> getMovies(
      {int index = 1, String q = '', String language = 'en'});
}
