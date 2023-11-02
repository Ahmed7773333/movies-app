part of 'movie_item_cubit.dart';

@immutable
abstract class MovieItemState {}

class MovieItemInitial extends MovieItemState {}

class MovieItemIChecking extends MovieItemState {}

class MovieItemChecked extends MovieItemState {}

class MovieItemChange extends MovieItemState {}

class MovieItemAdd extends MovieItemState {}
