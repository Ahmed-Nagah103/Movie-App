
import 'package:bloc/bloc.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/recommendations.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_now_playing_movie.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_popular_movie.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_recommendations.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_top_rated_movie.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/movie_details.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/entities/movie_details.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {

  MoviesCubit(this.getNowPlayingMovie, this.getPopularMovie,
      this.getTopRatedMovie, this.getMovieDetails, this.getRecommendations): super(MoviesInitial());

  GetNowPlayingMovieUseCase getNowPlayingMovie;
  GetPopularMovieUsaeCase getPopularMovie;
  GetTopRatedMovieUseCase getTopRatedMovie;
  GetMovieDetailsUseCase getMovieDetails;
  GetRecommendationsUseCase getRecommendations;

  List<Movie> nowPlayingMovies=[];
  List<Movie> popularMovies=[];
  List<Movie> topRatedMovies=[];
  List<Recommendations> recommendations=[];
  MovieDetails? movieDetails;



  Future<List<Movie>> executeGetNowPlayingMovie()async{
    emit(LoadingState());
     await getNowPlayingMovie.execute().then((value){
       value.fold(
         (left){
           print(left.message);
           emit(ErrorState());         },
           (right){
           nowPlayingMovies=right;
           emit(SuccessState());

           });
     });
     return nowPlayingMovies;

  }
  Future<List<Movie>?> executeGetPopularMovie()async{
    emit(LoadingState());
    await getPopularMovie.execute().then((value){
      value.fold(
              (left){
                print(left.message);
                emit(ErrorState())  ;        },
              (right){
            popularMovies=right;
            emit(SuccessState());
          });
    });
    return nowPlayingMovies;
  }
  Future<List<Movie>> executeGetTopRatedMovie()async{
    emit(LoadingState());
    await getTopRatedMovie.execute().then((value){
      value.fold(
              (left){
                print(left.message);
                emit(ErrorState());          },
              (right){
            topRatedMovies=right;
            emit(SuccessState());
          });
    });
    return topRatedMovies;
  }

  Future<void> executeGetMovieDetails(int movieId)async {
    emit(LoadingMovieDetailsState());
   var either= await getMovieDetails.execute(movieId);
    either.fold(
            (left) {
              emit(ErrorState());
              print(left.message);

        },
            (right) {
          movieDetails = right;
          emit(SuccessMovieDetailsState());
        });
    }



  Future<List<Recommendations>> executeGetRecommendations(int movieId)async{
    emit(LoadingRecommendationsState());
    await getRecommendations.execute(movieId).then((value){
      value.fold(
              (left){
                emit(ErrorState());
                print(left.message);
          },
              (right){
            recommendations=right;
            emit(SuccessRecommendationState());
          });
    });
    return recommendations;

    }


}
