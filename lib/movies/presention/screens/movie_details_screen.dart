import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/core/utils/constants/responsive.dart';
import 'package:movie_app_clean_arc/core/utils/extensions.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_arc/movies/domain/entities/recommendations.dart';
import 'package:movie_app_clean_arc/movies/presention/components/my_text.dart';
import 'package:movie_app_clean_arc/movies/presention/components/recommendations_builder.dart';
import 'package:movie_app_clean_arc/movies/presention/controller/movie_cubit/movies_cubit.dart';

class MovieDetailsScreen extends StatefulWidget {
  MovieDetailsScreen(
    this.movieId, {
    super.key,
  });

  int movieId;
  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late MoviesCubit moviesCubit;
  late Future<List<Recommendations>> movieRecommendations;
   MovieDetails? movieDetails;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    print('bloc initiatied');
    moviesCubit = BlocProvider.of<MoviesCubit>(context);
    moviesCubit.executeGetMovieDetails(widget.movieId);
    movieRecommendations=  moviesCubit.executeGetRecommendations(widget.movieId);

  }

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<MoviesCubit, MoviesState>(

        listener: (context,state){
          if(state is SuccessMovieDetailsState) {
          movieDetails = moviesCubit.movieDetails;
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppConstants.appBackgroundColor,
          body: movieDetails !=null
              ? SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      height: context.height() / 4,
                      width: context.width(),
                      child: Image.network(
                          fit: BoxFit.fill,

                         movieDetails?.backdropPath ??
                              '${AppConstants.errorPhotoPath}'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            '${moviesCubit.movieDetails?.title}',
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                          ),
                          Row(
                            children: [
                              MyText(
                                  '${movieDetails?.releaseDate}'),
                              SizedBox(
                                width: getWidth(30),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.yellow,
                              ),
                              MyText(
                                  '${movieDetails?.voteAverage}'),
                              SizedBox(
                                width: getWidth(50),
                              ),
                              MyText(
                                  ' ${movieDetails?.runtime} min '),
                            ],
                          ),
                          MyText(
                            '${movieDetails?.overview}',
                            fontSize: 14,
                          ),
                          SizedBox(
                            height: getHeight(10),
                          ),
                          MyText(
                            "Genres: ${movieDetails?.genres.map((e) {
                                  return '${e.name}';
                                }).toList().join(', ') //join to extract the e.name to only String
                            }",
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                          SizedBox(
                            height: getHeight(40),
                          ),
                          MyText("More Like This"),
                          SizedBox(
                            height: getHeight(10),
                          ),
                          FutureBuilder(
                            future: movieRecommendations ,
                            builder: (context,snapshot){
                               if (snapshot.hasData){
                                 return RecommendationsBuilder(
                                     movieId: movieDetails?.id??0);
                               }
                              else{
                                return Center(child: CircularProgressIndicator(color: Colors.yellow,));
                               }
                            },
                          ),
                        ],
                      ),
                    ),
                  ]),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: Colors.yellow,
                )),
        );
      },
    );
  }
}
