import '../../../core/api/models/movie_item.dart';

abstract class MovieDeatailsRepo {
  Future<PopularMoviesItems> getSimilarMovies({required int id});
}
