import 'package:data_connection_checker/data_connection_checker.dart';

abstract class NetworkInfoBase {
  Future<bool> get isConnected;
}

class NetworkInfo implements NetworkInfoBase {
  final DataConnectionChecker _dataConnectionChecker;

  NetworkInfo(this._dataConnectionChecker);

  @override
  Future<bool> get isConnected => _dataConnectionChecker.hasConnection;
}