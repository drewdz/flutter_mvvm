import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_course/app/app_preferences.dart';
import 'package:mvvm_course/app/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

const int connectionTimeout = 60*1000;

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();

    Map<String, String> headers = {
      contentType : applicationJson,
      accept : applicationJson,
      authorization : Constants.token,
      defaultLanguage : await _appPreferences.getAppLanguage()
    };

    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      connectTimeout: connectionTimeout,
      receiveTimeout: connectionTimeout,
      headers: headers
    );

    if (kDebugMode) {
      print ("logging enabled in debug mode");
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true
      ));
    }

    return dio;
  }
}