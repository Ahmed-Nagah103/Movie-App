import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_arc/core/error/exceptions.dart';
import 'package:movie_app_clean_arc/core/error/failure.dart';
import 'package:movie_app_clean_arc/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/recommendations.dart';
import 'package:movie_app_clean_arc/movies/domain/repository/base_movie_repostory.dart';

class MoviesRepositoryImp extends BaseMovieRepository {
  BaseMovieDataSource baseMovieDataSource;
  MoviesRepositoryImp(this.baseMovieDataSource);
  @override

  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {

    try {
      final result = await baseMovieDataSource.getMovieNowPlaying();
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerErrorFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieDataSource.getMoviePopular();

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerErrorFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieDataSource.getMovieTopRated();

      return Right(result);
    } on ServerException catch (failure) {

      return Left(ServerErrorFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int movieId) async{
    try {
      final result = await baseMovieDataSource.getMovieDetails(movieId);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerErrorFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendations>>> getRecommendations(int movieId) async {
    try {
      final result = await baseMovieDataSource.getRecommendations(movieId);

      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerErrorFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
