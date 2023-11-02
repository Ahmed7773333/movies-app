part of 'home_tab_cubit.dart';

@immutable
abstract class HomeTabState {}

class HomeTabInitial extends HomeTabState {}

class HomeLoadingState extends HomeTabState {}

class HomeErrorState extends HomeTabState {}

class HomeSuccessState extends HomeTabState {}

class HomeTabBookedState extends HomeTabState {}
