import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/datasource/network/api/photo_api.dart';
import 'package:flutter_architecture/data/datasource/network/dio_client.dart';
import 'package:flutter_architecture/data/repositories/photo_repository.dart';
import 'package:get_it/get_it.dart';

class ServiceProvider {
  static final _getIt = GetIt.I;

  T get<T extends Object>() => _getIt.get<T>();

  static final instance = ServiceProvider();

  void initialize() {
    _getIt.registerLazySingleton(() => Dio());
    _getIt.registerLazySingleton(() => DioClient(_getIt<Dio>()));
    _getIt
        .registerLazySingleton(() => PhotoApi(dioClient: _getIt<DioClient>()));
    _getIt.registerLazySingleton(() => PhotoRepository(_getIt<PhotoApi>()));
  }
}
