//  string extensions

import 'package:mvvm_course/app/constants.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.stringEmpty;
    }
    else{
      return this!;
    }
  }
}

//  int extensions

extension NonNullInt on int? {
  int orZero() {
    if (this == null) {
      return Constants.intZero;
    }
    else {
      return this!;
    }
  }
}