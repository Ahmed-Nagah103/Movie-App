import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/dependency_injector.dart';
import 'package:movie_app_clean_arc/core/utils/constants/responsive.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_cubit/movies_cubit.dart';
import 'package:movie_app_clean_arc/movies/presention/screens/movies_screen.dart';

import 'core/utils/constants/bloc_observer.dart';

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
