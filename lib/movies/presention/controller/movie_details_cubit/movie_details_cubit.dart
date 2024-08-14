import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/movie_details.dart';

import '../../../../core/dependency_injector.dart';
import '../../../../core/error/failure.dart';
import '../../../domain/entities/movie_details.dart';

part 'movie_details_state.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsState> {
  MovieDetailsCubit() : super(MovieDetailsInitial());



  // MovieDetails movieDetails;

  GetMovieDetailsUseCase getMovieDetails=GetMovieDetailsUseCase(sl());

  Future<MovieDetails?> executeGetMovieDetails(int movieId)async {
    emit(LoadingMovieDetailsState());
    MovieDetails? movie;
    Either<Failure, MovieDetails> movieDetails;
    movieDetails=  await getMovieDetails.execute(movieId);
        movieDetails.fold(
              (left) {
            return ServerErrorFailure(left.message);
          },
              (right) {
                emit(MoviDetailsSuccessState());

                return movie = right;
    });
    return movie;


  }



  // Future<List<Recommendations>?> executeGetRecommendations(int movieId)async{
  //   emit(LoadingRecommendationsState());
  //   await getRecommendations.execute(movieId).then((value){
  //     value.fold(
  //             (left){
  //           return ServerErrorFailure(left.message);
  //         },
  //             (right){
  //           recommendations=right;
  //           emit(SuccessState());
  //         });
  //   });
  //   return recommendations;
  //
  // }
}
