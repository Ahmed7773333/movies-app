import '../../../core/api/models/movie_details_item.dart';
import '../../../core/api/models/series_model.dart';
import '../../../core/api/models/movie_item.dart';

abstract class MovieDeatailsRepo {
  Future<PopularMoviesItems> getSimilarMovies({required int id});

  Future<SeriesModel> getSimilarSeriesMovies({required int id});

  Future<MovieDetailsItem> getMovieDetails({required int id});
}
