part of 'home_tab_cubit.dart';

@immutable
abstract class HomeTabState {}

class HomeTabInitial extends HomeTabState {}

class CarouselListLoadingState extends HomeTabState {}

class CarouselListErrorState extends HomeTabState {}

class CarouselListSuccessState extends HomeTabState {}

class ReleaseListLoadingState extends HomeTabState {}

class ReleaseListErrorState extends HomeTabState {}

class ReleaseListSuccessState extends HomeTabState {}

class RecomendedListLoadingState extends HomeTabState {}

class RecomendedListErrorState extends HomeTabState {}

class RecomendedListSuccessState extends HomeTabState {}

class HomeTabBookedState extends HomeTabState {}
