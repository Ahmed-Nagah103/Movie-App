part of 'movies_cubit.dart';

@immutable
sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}
final class LoadingState extends MoviesState {}
final class SuccessState extends MoviesState {}
final class ErrorState extends MoviesState {}
final class LoadingMovieDetailsState extends MoviesState {}
final class SuccessMovieDetailsState extends MoviesState {}
final class LoadingRecommendationsState extends MoviesState {}
final class SuccessRecommendationState extends MoviesState {}

//
// final class NowPlayingLoadingState extends MoviesState {}
// final class PopularLoadingState extends MoviesState {}
// final class TopRatingLoadingState extends MoviesState {}
// final class NowPlayingSuccessState extends MoviesState {}
// final class PopularSuccessState extends MoviesState {}
// final class TopRatingSuccessState extends MoviesState {}
