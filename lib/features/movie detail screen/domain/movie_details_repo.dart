import '../../../core/api/models/MovieDetailsItem.dart';
import '../../../core/api/models/movie_item.dart';

abstract class MovieDeatailsRepo {
  Future<PopularMoviesItems> getSimilarMovies({required int id});

  Future<MovieDetailsItem> getMovieDetails({required int id});
}
