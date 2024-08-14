import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_cubit/movies_cubit.dart';

import '../components/back_icon.dart';
import '../components/grid_builder.dart';
import '../components/my_text.dart';

class TopRatedMovieScreen extends StatefulWidget {
  const TopRatedMovieScreen({super.key});

  @override
  State<TopRatedMovieScreen> createState() => _TopRatedMovieScreenState();
}

class _TopRatedMovieScreenState extends State<TopRatedMovieScreen> {

  late MoviesCubit moviesCubit;

  @override
  void initState() {
    moviesCubit=BlocProvider.of<MoviesCubit>(context);
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        centerTitle: true,
        backgroundColor: AppConstants.appBackgroundColor,
        title: MyText('TopRated Movies'),
      ),
      backgroundColor: AppConstants.appBackgroundColor,
      body: MyGridBuilder(moviesList: moviesCubit.topRatedMovies)

    );
  }
}

