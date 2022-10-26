import 'package:flutter/material.dart';
import 'package:mvvm_course/app/di.dart';

import 'app/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModule();
  runApp(MainApp());
}
