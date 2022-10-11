
import 'package:flutter/material.dart';
import 'package:mvvm_course/presentation/resources/font_manager.dart';

TextStyle _getFontStyle(double size, String family, FontWeight weight, Color color) {
  return TextStyle(fontSize: size, fontFamily: family, fontWeight: weight, color: color);
}

//  regular text style

TextStyle getRegularStyle({ double fontSize = 12.0, required Color fontColor }){
  return _getFontStyle(fontSize, FontConstants.fontFamily, FontWeightConstants.regular, fontColor);
}

//  light text style

TextStyle getLightStyle({ double fontSize = 12.0, required Color fontColor }){
  return _getFontStyle(fontSize, FontConstants.fontFamily, FontWeightConstants.light, fontColor);
}

//  semi medium text style

TextStyle getMediumStyle({ double fontSize = 12.0, required Color fontColor }){
  return _getFontStyle(fontSize, FontConstants.fontFamily, FontWeightConstants.medium, fontColor);
}

//  semi bold text style

TextStyle getSemiBoldStyle({ double fontSize = 12.0, required Color fontColor }){
  return _getFontStyle(fontSize, FontConstants.fontFamily, FontWeightConstants.semiBold, fontColor);
}

//  bold text style

TextStyle getBoldStyle({ double fontSize = 12.0, required Color fontColor }){
  return _getFontStyle(fontSize, FontConstants.fontFamily, FontWeightConstants.bold, fontColor);
}

