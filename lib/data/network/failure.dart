//  TODO: refactor this out and use service result instead
import 'package:mvvm_course/data/network/error_handler.dart';

class Failure {
  int code;
  String message;

  Failure(this.code, this.message);
}

class DefaultFailure extends Failure {
  DefaultFailure() : super(ResponseCode.unknownError, ResponseMessage.unknownError);
}