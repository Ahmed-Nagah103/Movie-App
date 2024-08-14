import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_arc/movies/domain/repository/base_movie_repostory.dart';
import '../../../core/error/failure.dart';
import '../entities/movie_details.dart';

class GetMovieDetailsUseCase{
  BaseMovieRepository baseMovieRepository;
  GetMovieDetailsUseCase(this.baseMovieRepository);
  Future<Either<Failure,MovieDetails>> execute(int movieId)async{
    return await baseMovieRepository.getMovieDetails(movieId );
  }

}