import '../../../api/models/movie_item.dart';

abstract class MovieItemRepo {
  Future<bool> isBooked(int id);
  Future<void> addToWatchlist(Results movie);
  Future<void> deleteFromWatchlist(Results movie);
}
