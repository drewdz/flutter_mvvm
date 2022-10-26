import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mvvm_course/app/app_preferences.dart';
import 'package:mvvm_course/data/data_source/remote_data_source.dart';
import 'package:mvvm_course/data/network/app_api.dart';
import 'package:mvvm_course/data/network/dio_factory.dart';
import 'package:mvvm_course/data/network/network_info.dart';
import 'package:mvvm_course/data/repository/repository.dart';
import 'package:mvvm_course/domain/use_case/login_use_case.dart';
import 'package:mvvm_course/presentation/login/login_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //  shared preferences
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //  app preferences
  instance.registerLazySingleton<AppPreferences>(() => AppPreferences(instance())); //   = instance<SharedPreferences>(); - get instance of

  //  network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfo(DataConnectionChecker()));

  //  dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //  app service client
  Dio dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  //  remove data source
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource(instance()));

  //  repository
  instance.registerLazySingleton<Repository>(() => Repository(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance<Repository>()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance<LoginUseCase>()));
  }
}