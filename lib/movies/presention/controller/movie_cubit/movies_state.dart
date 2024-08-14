part of 'movies_cubit.dart';

sealed class MoviesState {}

final class MoviesInitial extends MoviesState {}
final class LoadingState extends MoviesState {}
final class SuccessState extends MoviesState {}
final class ErrorState extends MoviesState {}
final class LoadingMovieDetailsState extends MoviesState {}
final class SuccessMovieDetailsState extends MoviesState {}
final class LoadingRecommendationsState extends MoviesState {}
final class SuccessRecommendationState extends MoviesState {}
