import 'package:mvvm_course/data/request/request.dart';
import 'package:mvvm_course/data/responses/responses.dart';

import '../network/app_api.dart';

abstract class RemoteDataSourceBase {
  Future<LoginResponse> login(LoginRequest loginRequest);
}

class RemoteDataSource implements RemoteDataSourceBase {
  AppServiceClient _appServiceClient;

  RemoteDataSource(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(loginRequest.email, loginRequest.password, loginRequest.imei, loginRequest.deviceType);
  }
}