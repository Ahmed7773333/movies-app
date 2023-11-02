part of 'search_tab_cubit.dart';

@immutable
abstract class SearchTabState {}

class SearchTabInitial extends SearchTabState {}

class SearchListLoadingState extends SearchTabState {}

class SearchListSuccessState extends SearchTabState {}

class SearchListErrorState extends SearchTabState {}

class SearchKeyWordState extends SearchTabState {}
