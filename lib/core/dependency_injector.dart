
import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_arc/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_clean_arc/movies/data/repository/movies_repository_imp.dart';
import 'package:movie_app_clean_arc/movies/domain/repository/base_movie_repostory.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_now_playing_movie.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_popular_movie.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_recommendations.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_top_rated_movie.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/movie_details.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_cubit/movies_cubit.dart';

final  sl = GetIt.instance;

class DependencyInjector {
 init (){



   sl.registerFactory<MoviesCubit>(()=>MoviesCubit(sl(),sl(),sl(),sl(),sl()));
   //repo
   sl.registerLazySingleton<BaseMovieRepository>(()=>MoviesRepositoryImp(sl()));
   //DataSource
   sl.registerLazySingleton<BaseMovieDataSource>(()=>MovieRemoteDataSource());
   //UseCases
   sl.registerLazySingleton<GetMovieDetailsUseCase>(()=>GetMovieDetailsUseCase(sl()));
   sl.registerLazySingleton(()=>GetPopularMovieUsaeCase(sl()));
   sl.registerLazySingleton(()=>GetNowPlayingMovieUseCase(sl()));
   sl.registerLazySingleton(()=>GetTopRatedMovieUseCase(sl()));
   sl.registerLazySingleton(()=>GetRecommendationsUseCase(sl()));
 }

}