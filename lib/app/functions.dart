import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

import '../domain/model/model.dart';
import 'constants.dart';

Future<DeviceInfo> getDeviceDetails() async {
  String name = "unknown";
  String identifier = "unknown";
  String version = "unknown";

  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  try {
    if (Platform.isAndroid) {
      var build = await deviceInfoPlugin.androidInfo;
      name = "${build.model ?? Constants.stringEmpty} ${build.brand ?? Constants.stringEmpty}";
      identifier = build.id ?? Constants.stringEmpty;
      version = build.version.toString();
    }
    else if (Platform.isIOS) {
      var build = await deviceInfoPlugin.iosInfo;
      name = "${build.name ?? Constants.stringEmpty} ${build.model ?? Constants.stringEmpty}";
      identifier = build.identifierForVendor ?? Constants.stringEmpty;
      version = build.systemVersion ?? Constants.stringEmpty;
    }
  }
  on PlatformException {
    return DeviceInfo(name, identifier, version);
  }
  return DeviceInfo(name, identifier, version);
}