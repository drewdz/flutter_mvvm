import 'package:flutter/material.dart';
import 'package:mvvm_course/presentation/resources/color_manager.dart';
import 'package:mvvm_course/presentation/resources/font_manager.dart';
import 'package:mvvm_course/presentation/resources/styles_manager.dart';
import 'package:mvvm_course/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    //  main colors
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryLight,
    primaryColorDark: ColorManager.primaryDark,
    splashColor: ColorManager.rippleAndSplash,
    disabledColor: ColorManager.disabled,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: ColorManager.cardShadow), //  replaces accept color

    //  card view theme
    cardTheme: CardTheme(
      color: ColorManager.card,
      shadowColor: ColorManager.cardShadow,
      elevation: AppSize.elevation
    ),

    //  app bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.elevation,
      shadowColor: ColorManager.appBarShadow,
      titleTextStyle: getRegularStyle(fontColor: ColorManager.appBarTitle, fontSize: FontSizeConstants.appBarTitle)
    ),

    //  buttons theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.disabled,
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.rippleAndSplash
    ),

    //  elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(fontColor: ColorManager.buttonText),
        backgroundColor: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.buttonRadius))
      )
    ),

    //  text theme
    textTheme: TextTheme(
      headline1: getSemiBoldStyle(fontColor: ColorManager.headline1, fontSize: FontSizeConstants.headline1),
      subtitle1: getMediumStyle(fontColor: ColorManager.subtitle1, fontSize: FontSizeConstants.subtitle1),
      caption: getRegularStyle(fontColor: ColorManager.caption, fontSize: FontSizeConstants.caption),
      bodyText1: getRegularStyle(fontColor: ColorManager.bodyText, fontSize: FontSizeConstants.bodyText)
    ),
    //  input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.contentPadding),
      hintStyle: getRegularStyle(fontColor: ColorManager.hintText, fontSize: FontSizeConstants.hintText),
      labelStyle: getMediumStyle(fontColor: ColorManager.labelText, fontSize: FontSizeConstants.labelText),
      errorStyle: getRegularStyle(fontColor: ColorManager.error, fontSize: FontSizeConstants.errorText),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.borderEnabled, width: AppSize.borderWidth),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.borderRadius))
        ),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.borderFocused, width: AppSize.borderWidth),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.borderRadius))
      ),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.error, width: AppSize.borderWidth),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.borderRadius))
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManager.borderFocused, width: AppSize.borderWidth),
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.borderRadius))
      )),
  );
}