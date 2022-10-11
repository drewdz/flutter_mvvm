
import 'package:flutter/material.dart';
import 'package:mvvm_course/app/main_app.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  void updateAppState() {
    MainApp.instance.appState = 10;
  }

  void getAppState(){
      print(MainApp.instance.appState);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
