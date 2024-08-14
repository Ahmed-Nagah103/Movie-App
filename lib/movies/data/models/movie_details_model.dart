import 'package:movie_app_clean_arc/movies/data/models/genre_model.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie_details.dart';

import '../../../core/utils/constants/app_constants.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({required super.backdropPath,
    required super.genres, required super.id,
    required super.overview, required super.releaseDate,
    required super.runtime, required super.title,
    required super.voteAverage});

  factory MovieDetailsModel.fromJson(Map json){
    return MovieDetailsModel(
        backdropPath: json['backdrop_path']!=null? '${AppConstants.photoBaseUrl}${json['backdrop_path']}'
:AppConstants.errorPhotoPath,
        genres: List<GenreModel>.from
          (json['genres'].map((e){  return GenreModel.fromJson(e);})) ,
        id: json['id'],
        overview: json['overview'],
        releaseDate: json['release_date'],
        runtime: json['runtime'],
        title: json['title'],
        voteAverage: json['vote_average']
    );
  }


}