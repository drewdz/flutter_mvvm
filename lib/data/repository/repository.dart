import 'package:dartz/dartz.dart';
import 'package:mvvm_course/data/mapper/mapper.dart';
import 'package:mvvm_course/data/network/error_handler.dart';
import 'package:mvvm_course/data/network/failure.dart';
import 'package:mvvm_course/data/request/request.dart';
import 'package:mvvm_course/domain/model/model.dart';

import '../../domain/repository/repository.dart';
import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class Repository extends RepositoryBase {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  Repository(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          //  success
          return Right(response.toDomain());
        }
        else {
          //  failure
          //  TODO: refactor and return the value in the service result
          return Left(Failure(response.status ?? ApiInternalStatus.failure, ResponseMessage.unknownError));
        }
      }
      catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    }
    else {
      //  TODO: refactor and return the value in the service result
      return Left(ResponseType.noConnection.getFailure());
    }
  }
}