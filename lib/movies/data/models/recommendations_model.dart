import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/recommendations.dart';

class RecommendationsModel extends Recommendations {
  RecommendationsModel(
      {required super.id,  required super.backdropPath, });

  factory RecommendationsModel.fromJson(Map json){
    return RecommendationsModel(
        id: json['id'],
      backdropPath: json['backdrop_path']!=null? '${AppConstants.photoBaseUrl}${json['backdrop_path']}'
          :AppConstants.errorPhotoPath,
    );
  }


}