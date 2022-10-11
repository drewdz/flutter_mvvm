import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_course/presentation/forgot_password/forgot_password_view.dart';
import 'package:mvvm_course/presentation/login/login_view.dart';
import 'package:mvvm_course/presentation/main/main_view.dart';
import 'package:mvvm_course/presentation/onboarding/onboarding_view.dart';
import 'package:mvvm_course/presentation/register/register_view.dart';
import 'package:mvvm_course/presentation/resources/strings_manager.dart';
import 'package:mvvm_course/presentation/splash/splash.dart';
import 'package:mvvm_course/presentation/store_details/store_details.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => OnboardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => StoreDetailsView());
      default:
        return UndefinedRoute();
    }
  }

  static Route<dynamic> UndefinedRoute() {
    return MaterialPageRoute(builder: (_) =>
        Scaffold(
          appBar: AppBar(title: const Text(StringsManager.unknownRouteTitle)),
          body: const Center(child: Text(StringsManager.unknownRouteBody)),
        )
    );
  }
}