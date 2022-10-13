import 'package:dartz/dartz.dart';
import 'package:mvvm_course/domain/model/model.dart';

import '../../data/network/failure.dart';
import '../../data/request/request.dart';

abstract class RepositoryBase {
  //  TODO: refactor this and remove the need for Either and use service result instead.
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);
}