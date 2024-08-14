import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/movies/presention/components/back_icon.dart';
import 'package:movie_app_clean_arc/movies/presention/components/my_text.dart';

import '../../../core/utils/constants/app_constants.dart';
import '../components/grid_builder.dart';
import '../controller/movie_cubit/movies_cubit.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({super.key});

  @override
  State<PopularMovieScreen> createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen> {
  late MoviesCubit moviesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesCubit=BlocProvider.of<MoviesCubit>(context);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        centerTitle: true,
        backgroundColor: AppConstants.appBackgroundColor,
        title: MyText('Popular Movies'),
      ),
      backgroundColor: AppConstants.appBackgroundColor,
      body:  MyGridBuilder(moviesList: moviesCubit.popularMovies),
    );
  }
}



