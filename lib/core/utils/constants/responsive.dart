
import 'package:flutter/material.dart';

class SizeConfigs {
  static MediaQueryData? _mediaQueryData;
  static  late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
    // So if the screen size increase or decrease then our defaultSize also vary

    if(orientation == Orientation.landscape) {
      defaultSize = screenHeight! * 0.024;
    }
    else{
      defaultSize= screenWidth! * 0.024;

    }
  }


}

double getFont(double size) {

  double defaultsSize = SizeConfigs.defaultSize * size;
  return (defaultsSize / 10);
}

// Get the proportionate height as per screen size
double getHeight(double inputHeight) {
  double screenHeight = SizeConfigs.screenHeight!;
  // 812 is the layout height that designer use
  return (inputHeight / 928.0) * screenHeight;
}

// Get the proportionate width as per screen size
double getWidth(double inputWidth) {
  double screenWidth = SizeConfigs.screenWidth!;
  // 375 is the layout width that Figma provides
  return (inputWidth / 426.0) * screenWidth;
}

