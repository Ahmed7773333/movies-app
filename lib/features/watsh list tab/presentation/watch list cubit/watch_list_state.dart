part of 'watch_list_cubit.dart';

@immutable
abstract class WatchListState {}

class WatchListInitial extends WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListSuccessState extends WatchListState {}

class WatchListErrorState extends WatchListState {}

class DeletedState extends WatchListState {}
