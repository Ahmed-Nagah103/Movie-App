import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_arc/movies/domain/repository/base_movie_repostory.dart';

import '../../../core/error/failure.dart';

class GetTopRatedMovieUseCase{

  BaseMovieRepository baseMovieRepository;

  GetTopRatedMovieUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Movie>>> execute()async{

    return await baseMovieRepository.getTopRatedMovies();
  }

}