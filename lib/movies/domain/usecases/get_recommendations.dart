import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/recommendations.dart';
import 'package:movie_app_clean_arc/movies/domain/repository/base_movie_repostory.dart';

import '../../../core/error/failure.dart';

class GetRecommendationsUseCase{

  BaseMovieRepository baseMovieRepository;

  GetRecommendationsUseCase(this.baseMovieRepository);

  Future<Either<Failure,List<Recommendations>>> execute(int movieId)async{

    return await baseMovieRepository.getRecommendations(movieId);
  }

}