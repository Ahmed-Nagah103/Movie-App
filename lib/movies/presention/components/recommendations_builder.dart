import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/core/utils/extensions.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_cubit/movies_cubit.dart';

import '../screens/movie_details_screen.dart';

class RecommendationsBuilder extends StatefulWidget {
  RecommendationsBuilder({
    super.key,
    required this.movieId,
  });

  final int movieId;


  @override
  State<RecommendationsBuilder> createState() => _RecommendationsBuilderState();
}

class _RecommendationsBuilderState extends State<RecommendationsBuilder> {
  late MoviesCubit moviesCubit;
  @override
  void initState() {

     moviesCubit=BlocProvider.of<MoviesCubit>(context);
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return

      GridView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: moviesCubit.recommendations.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: ((context.width()/AppConstants.categoryImgWidth).toInt()) ,
          mainAxisSpacing: 12,
          mainAxisExtent:AppConstants.itemComponentsHeight(context),
        ), itemBuilder: (context,index){
      return GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) {
            return MovieDetailsScreen(moviesCubit.recommendations[index].id);
          }));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network('${moviesCubit.recommendations[index].backdropPath}',
            height: AppConstants.categoryImgHeight,width: AppConstants.categoryImgWidth,fit: BoxFit.fill,),
        ),
      );
    });
  }
}
