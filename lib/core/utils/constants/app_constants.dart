import 'dart:core';

import 'package:flutter/material.dart';
import 'package:movie_app_clean_arc/core/utils/constants/responsive.dart';

class AppConstants{

  static String  baseUrl='https://api.themoviedb.org/3/' ;
  static String  apiKey='d5e6e0109d0bd7752d89421a7972a156' ;

  static String  nowPlaying='${baseUrl}movie/now_playing?api_key=$apiKey' ;
  static String  topRated='${baseUrl}movie/top_rated?api_key=$apiKey' ;
  static String  popular='${baseUrl}movie/popular?api_key=$apiKey' ;
  static String  photoBaseUrl='https://image.tmdb.org/t/p/w500';
  static String  errorPhotoPath='https://cdn.pixabay.com/photo/2015/06/09/16/12/error-803716_1280.png';
  static double carousalHeight= getHeight(350);
  static double carousalWidth= double.infinity;
  static double categoryImgHeight= getHeight(200);
  static double categoryImgWidth= getHeight(150);
  // static double itemComponentsHeight= getHeight(180);
  static Color textPrimaryColor= Colors.white;
  static Color appBackgroundColor= Colors.grey.shade900;

  static String  movieDetails(int movieId){
   return '${baseUrl}movie/${movieId}?api_key=$apiKey';
  }

  static String  movieRecommendations(int movieId){
   return '${baseUrl}movie/${movieId}/recommendations?api_key=$apiKey';
  }

  static double itemComponentsHeight (context){
   return MediaQuery.sizeOf(context).height/5;
  }
}