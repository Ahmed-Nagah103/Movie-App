import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_arc/core/error/failure.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_arc/movies/domain/repository/base_movie_repostory.dart';

class GetNowPlayingMovieUseCase{

  BaseMovieRepository baseMovieRepository;

  GetNowPlayingMovieUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Movie>>> execute()async{

    return await baseMovieRepository.getNowPlayingMovies();
  }

}