import 'package:flutter/material.dart';
import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MainApp extends StatefulWidget {
  MainApp._internal() {
    // TODO: implement MainApp._internal
  } // private named constructor
  int appState = 0;
  static final MainApp instance = MainApp._internal();

  factory MainApp() => instance;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme()
    );
  }
}
