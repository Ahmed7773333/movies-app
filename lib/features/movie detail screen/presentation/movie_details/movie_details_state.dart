part of 'movie_details_cubit.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsILoading extends MovieDetailsState {}

class MovieDetailsError extends MovieDetailsState {}

class MovieDetailsSucces extends MovieDetailsState {}
