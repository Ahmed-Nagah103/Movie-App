import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/dependency_injector.dart';
import 'package:movie_app_clean_arc/core/utils/constants/responsive.dart';
import 'package:movie_app_clean_arc/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movie_app_clean_arc/movies/data/models/movie_model.dart';
import 'package:movie_app_clean_arc/movies/data/repository/movies_repository_imp.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_arc/movies/domain/repository/base_movie_repostory.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_popular_movie.dart';
import 'package:movie_app_clean_arc/movies/domain/usecases/get_top_rated_movie.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_cubit/movies_cubit.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_details_cubit/movie_details_cubit.dart';
import 'package:movie_app_clean_arc/movies/presention/screens/movie_details_screen.dart';
import 'package:movie_app_clean_arc/movies/presention/screens/movies_screen.dart';

import 'core/utils/constants/bloc_observer.dart';
import 'movies/domain/usecases/get_now_playing_movie.dart';

void main() async {
  Bloc.observer = MyBlocObserver();

  DependencyInjector().init();


  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfigs().init(context);

    return
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => sl<MoviesCubit>(),
          ),
          // BlocProvider(
          //   create: (context) => MovieDetailsCubit(),
          // ),
        ],
        child: MaterialApp(
          home: MoviesScreen(),
        ),
      );
  }
}
