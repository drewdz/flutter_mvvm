import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mvvm_course/presentation/resources/assets_manager.dart';
import 'package:mvvm_course/presentation/resources/routes_manager.dart';

import '../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  void _startDelay() {
    //  TODO: do we need to create a separate instance and dispose?
    var timer = Timer(const Duration(seconds: 5), () => Navigator.pushReplacementNamed(context, Routes.onboardingRoute));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(child: Image(image: AssetImage(ImageAssets.splashLogo))),
    );
  }
}
