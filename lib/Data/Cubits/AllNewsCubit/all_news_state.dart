part of 'all_news_cubit.dart';

@immutable
abstract class AllNewsState {}

class AllNewsInitial extends AllNewsState {}

class AllNewsLoading extends AllNewsState {}

class AllNewsSuccess extends AllNewsState {
  final AllNews ourResponse;
  AllNewsSuccess({required this.ourResponse});
}

class AllNewsError extends AllNewsState {}
