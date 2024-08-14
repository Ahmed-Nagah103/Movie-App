import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/core/utils/extensions.dart';
import 'package:movie_app_clean_arc/movies/presention/components/popular_component.dart';
import 'package:movie_app_clean_arc/movies/presention/components/top_rated_compnent.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_cubit/movies_cubit.dart';
import 'package:movie_app_clean_arc/movies/presention/screens/movie_details_screen.dart';
import 'package:movie_app_clean_arc/movies/presention/screens/popular_screen.dart';
import 'package:movie_app_clean_arc/movies/presention/screens/top_rated_screen.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesCubit moviesCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moviesCubit= BlocProvider.of<MoviesCubit>(context);
   moviesCubit.executeGetNowPlayingMovie().then((value){
     moviesCubit.executeGetPopularMovie().then((value)async{
       await moviesCubit.executeGetTopRatedMovie();
     });
   });


  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesCubit ,MoviesState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body:
          state is LoadingState  ?
      Center(child: CircularProgressIndicator(color: Colors.yellow,))
       :
      SingleChildScrollView(
        child:
         Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CarouselSlider(
                        items: moviesCubit.nowPlayingMovies.map(
                                (e){
                                 return SizedBox(
                                   width: double.infinity,
                                   child: Stack(
                                     alignment: Alignment.center,
                                     children: [
                                       GestureDetector(
                                         onTap: ()async {
                                           // state =LoadingMovieDetailsState();

                                           Navigator.push(context, MaterialPageRoute(builder: (context){
                                             return MovieDetailsScreen(e.id) ;
                                           }));
                                         },
                                         child: Image(image: NetworkImage(e.backdropPath),
                                         height: AppConstants.carousalHeight,
                                         fit: BoxFit.fill,),
                                       ),
                                       Positioned(
                                         bottom: 60,
                                           child:
                                       Text('Now Playing',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),

                                       ),
                                       Positioned(
                                         bottom: 15 ,
                                           child:
                                       Text('${e.title}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900,fontSize: 20),),

                                       ),

                                     ],
                                   ),
                                 );
                                }).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: AppConstants.carousalHeight,
                        ),),


            SizedBox(height: context.height()/20,),
            PopularComponent( categoryTitle: 'Popular' ,seeMoreOnTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return PopularMovieScreen();
              }));
            },),
            SizedBox(height: context.height()/50,),
            TopRatedComponent( categoryTitle: 'TopRated' ,seeMoreOnTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return TopRatedMovieScreen();
              }));
            },),
          ],
        ),
      ),
    );
  },
);
  }
}
