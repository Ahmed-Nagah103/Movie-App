import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movie_app_clean_arc/core/utils/constants/app_constants.dart';
import 'package:movie_app_clean_arc/core/utils/constants/responsive.dart';

class MyText extends StatelessWidget {
   MyText(this.text,{super.key,this.overflow,this.fontFamily,this.color,this.fontSize,this.fontWeight,this.textAlign,this.maxLines });
  String text;
  Color? color ;
  double? fontSize;
  FontWeight? fontWeight ;
   String? fontFamily ;
   TextOverflow? overflow;
   TextAlign? textAlign;
   int? maxLines;
   @override
  Widget build(BuildContext context) {
    return  Text(
      textAlign: textAlign,
      text,
      maxLines: maxLines,
      style: TextStyle(
        color:color??AppConstants.textPrimaryColor ,
        fontSize:getFont(fontSize??18)  ,
        fontWeight: fontWeight ,
        fontFamily:fontFamily ,
        overflow: overflow ,



      ),

    );
  }
}
