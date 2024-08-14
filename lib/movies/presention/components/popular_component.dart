import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/core/utils/dummy.dart';

import '../controller/movie_cubit/movies_cubit.dart';
import '../screens/movie_details_screen.dart';
import 'my_text.dart';

class PopularComponent extends StatefulWidget {
   PopularComponent({super.key,this.seeMoreOnTap,required this.categoryTitle});


   Function()? seeMoreOnTap;
   String categoryTitle;

  @override
  State<PopularComponent> createState() => _PopularComponentState();
}

class _PopularComponentState extends State<PopularComponent> {
  late MoviesCubit moviesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     moviesCubit= BlocProvider.of<MoviesCubit>(context);

  }
  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<MoviesCubit, MoviesState>(
  builder: (context, state) {
    return Column(
        children: [
          Row(
            children: [
              MyText(widget.categoryTitle),
              Spacer(),
              InkWell(
                onTap: widget.seeMoreOnTap,
                child: Row(
                  children: [
                    MyText('SeeMore',
                      fontSize: 14,
                    ),
                  Icon(Icons.arrow_forward_ios_outlined,color: Colors.white,size: 14,),
                  ],
                ),
              ),

            ],
          ),
          Container(
            height: AppConstants.categoryImgHeight ,
            child: ListView.builder(
              shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: moviesCubit.popularMovies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:
                (context,index){
                  return Padding(
                    padding:EdgeInsetsDirectional.fromSTEB(0, 0, 10,0 ),
                    child: GestureDetector(
                        onTap: () {
                          state= LoadingMovieDetailsState();
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) {
                            return MovieDetailsScreen(moviesCubit.popularMovies[index].id);
                          }));
                        },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network('${moviesCubit.popularMovies[index].backdropPath}',
                          height: AppConstants.categoryImgHeight,width: AppConstants.categoryImgWidth,fit: BoxFit.fill,),
                      ),
                    ),
                  );

                }),
          ),
        ],
      );
  },
),
    );
  }
}
