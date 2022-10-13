import 'package:dio/dio.dart';

import 'failure.dart';

//  TODO: consider refactoring this to make it more dynamic and easier to maintain.
enum ResponseType {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServiceError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noConnection,
  unknown
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      //  API error response
      failure = _handleError(error);
    }
    else {
      failure = ResponseType.unknown.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch(error.type) {

      case DioErrorType.connectTimeout:
        return ResponseType.connectionTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return ResponseType.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return ResponseType.receiveTimeout.getFailure();
      case DioErrorType.response:
        switch(error.response!.statusCode) {
          case ResponseCode.badRequest:
            return ResponseType.badRequest.getFailure();
          case ResponseCode.forbidden:
            return ResponseType.forbidden.getFailure();
          case ResponseCode.unauthorized:
            return ResponseType.unauthorized.getFailure();
          case ResponseCode.notFound:
            return ResponseType.notFound.getFailure();
          case ResponseCode.internalServiceError:
            return ResponseType.internalServiceError.getFailure();
          default:
            return ResponseType.unknown.getFailure();
        }
      case DioErrorType.cancel:
        return ResponseType.cancel.getFailure();
      case DioErrorType.other:
        return ResponseType.unknown.getFailure();
      default:
        return ResponseType.unknown.getFailure();
    }
  }
}

extension DataSourceExtension on ResponseType {
  Failure getFailure() {
    switch(this){
      case ResponseType.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.badRequest);
      case ResponseType.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.forbidden);
      case ResponseType.unauthorized:
        return Failure(ResponseCode.unauthorized, ResponseMessage.unauthorized);
      case ResponseType.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.notFound);
      case ResponseType.internalServiceError:
        return Failure(ResponseCode.internalServiceError, ResponseMessage.internalServiceError);
      case ResponseType.connectionTimeout:
        return Failure(ResponseCode.connectionTimeout, ResponseMessage.connectionTimeout);
      case ResponseType.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.cancel);
      case ResponseType.receiveTimeout:
        return Failure(ResponseCode.receiveTimeout, ResponseMessage.receiveTimeout);
      case ResponseType.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.sendTimeout);
      case ResponseType.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.cacheError);
      case ResponseType.noConnection:
        return Failure(ResponseCode.noConnection, ResponseMessage.noConnection);
      default:
        return Failure(ResponseCode.unknownError, ResponseMessage.unknownError);
    }
  }
}

class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorized = 401;
  static const int notFound = 404;
  static const int internalServiceError = 500;

  static const int unknownError = -1;
  static const int connectionTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noConnection = -7;
}

class ResponseMessage {
  static const String success = "Success";
  static const String noContent = "Accepted";
  static const String badRequest = "Bad Request";
  static const String forbidden = "Forbidden";
  static const String unauthorized = "Unauthorized";
  static const String notFound = "Not Found";
  static const String internalServiceError = "Internal Service Error";

  static const String unknownError = "Unknown Error";
  static const String connectionTimeout = "Connection Timeout";
  static const String cancel = "Cancelled";
  static const String receiveTimeout = "Receive Timeout";
  static const String sendTimeout = "Send Timeout";
  static const String cacheError = "Cache Error";
  static const String noConnection = "No Connection";
}

class ApiInternalStatus {
  static const int success = 0;
  static const int failure = 1;
}