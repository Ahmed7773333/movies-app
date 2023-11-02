import '../../../core/api/models/movie_item.dart';

abstract class SearchRepo {
  Future<PopularMoviesItems> getMovies(String q);
}
