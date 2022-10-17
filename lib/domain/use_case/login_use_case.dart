import 'package:dartz/dartz.dart';
import 'package:mvvm_course/app/functions.dart';
import 'package:mvvm_course/data/network/failure.dart';
import 'package:mvvm_course/data/repository/repository.dart';
import 'package:mvvm_course/domain/use_case/base_use_case.dart';

import '../../data/request/request.dart';
import '../model/model.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Login> {
  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Login>> execute(LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(LoginRequest(input.email, input.password, deviceInfo.identifier, deviceInfo.name));
  }
}

//  TODO: refactor to reduce number of data transfers. Do we really have to parse data through sooo many models?
class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(this.email, this.password);
}