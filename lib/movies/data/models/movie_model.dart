import 'package:movie_app_clean_arc/movies/domain/entities/movie.dart';

import '../../../core/utils/constants/app_constants.dart';

class MovieModel extends Movie {
  MovieModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genreIds,
      required super.voteAverage,
      required super.overview,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path']!=null? '${AppConstants.photoBaseUrl}${json['backdrop_path']}'
            :AppConstants.errorPhotoPath,
        genreIds: List.from(json['genre_ids'].map((e)=>e)),
        voteAverage: json['vote_average'],
        overview: json['overview'],
        releaseDate: json['release_date']);
  }
}
