import '../../../core/api/models/movie_item.dart';

abstract class WatchListRepo {
  Future<PopularMoviesItems> getWatchlistMovies();
  Future<void> deleteFromWatchlist(Results movie);
}
