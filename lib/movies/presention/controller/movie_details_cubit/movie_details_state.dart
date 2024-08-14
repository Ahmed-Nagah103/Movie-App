part of 'movie_details_cubit.dart';

@immutable
sealed class MovieDetailsState {}


final class MovieDetailsInitial extends MovieDetailsState {}
final class LoadingMovieDetailsState extends MovieDetailsState {}
final class MoviDetailsSuccessState extends MovieDetailsState {}
final class LoadingRecommendationsState extends MovieDetailsState {}
