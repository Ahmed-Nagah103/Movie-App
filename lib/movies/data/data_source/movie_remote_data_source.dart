import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app_clean_arc/core/error/exceptions.dart';
import 'package:movie_app_clean_arc/core/network/error_message_model.dart';
import 'package:movie_app_clean_arc/movies/data/models/movie_details_model.dart';
import 'package:movie_app_clean_arc/movies/data/models/movie_model.dart';
import 'package:movie_app_clean_arc/movies/data/models/recommendations_model.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie_details.dart';

import '../../../core/utils/constants/app_constants.dart';


abstract class  BaseMovieDataSource{

  Future<List<MovieModel>> getMovieNowPlaying();
  Future<List<MovieModel>> getMovieTopRated();
  Future<List<MovieModel>> getMoviePopular();
  Future<MovieDetails> getMovieDetails(int movieId);
  Future<List<RecommendationsModel>> getRecommendations(int movieId);
}


class MovieRemoteDataSource extends BaseMovieDataSource{

  final dio = Dio(BaseOptions(
    validateStatus: (status) {
      return status! < 500; // Only throw exceptions for status codes 500 and above
    },
  ));
  Future<List<MovieModel>> getMovieNowPlaying() async {
  final  response = await dio.get('${AppConstants.nowPlaying}');

      if(response.statusCode==200){
    return List<MovieModel>.from((response.data['results'] as List).map
      ((e)=>MovieModel.fromJson(e),
    )) ;
  }
      else{
        throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
      }
  }

  @override
  Future<List<MovieModel>> getMoviePopular() async {
    Response response;
    response = await dio.get('${AppConstants.popular}');

    if(response.statusCode==200){
      return List.from((response.data['results'] as List).map((e)=>MovieModel.fromJson(e))) ;
    }
    else{
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getMovieTopRated() async {
    Response response;
    response = await dio.get('${AppConstants.topRated}');

    if(response.statusCode==200){
      return List.from((response.data['results'] as List).map((e)=>MovieModel.fromJson(e))) ;
    }
    else{
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async{
    /*
    Future<Either<Failure,MovieDetails>> getMovieDetails(int movieId) async{
    Response response;
    print(AppConstants.movieDetails(movieId));
    response = await dio.get(
      '${AppConstants.movieDetails(movieId)}',
    );

    if(response.statusCode==200){
      return Right(MovieDetailsModel.fromJson(response.data)) ;
    }
    else{
      return Left (ServerErrorFailure( ErrorMessageModel.fromJson(response.data).statusMessage ));
    }
  }

    **/

    Response response;

    print(AppConstants.movieDetails(movieId));
    response = await dio.get(
      '${AppConstants.movieDetails(movieId)}',
    );

    if(response.statusCode==200){
      return MovieDetailsModel.fromJson(response.data) ;
    }
    else{
      print(" my error is ${response.data['status_message']}");
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationsModel>> getRecommendations(int movieId)async {

    Response response;
    response = await dio.get('${AppConstants.movieRecommendations(movieId)}');

    if(response.statusCode==200){
      return  List.from((response.data['results'] as List).map((e)=>RecommendationsModel.fromJson(e))) ;
    }
    else{
      throw ServerException(errorMessageModel:ErrorMessageModel.fromJson(response.data));
    }

  }


}