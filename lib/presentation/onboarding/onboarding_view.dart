import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.bodyBackground,
      body: const Center(child: Text("Welcome to onboarding")),
    );
  }
}
