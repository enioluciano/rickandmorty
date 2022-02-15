import 'dart:io';

import 'package:dio/dio.dart';
import 'package:projetorickmorty/app/services/configuration.dart';

class DioService {
  Dio client = Dio();

  DioService() {
    BaseOptions options = BaseOptions(
        connectTimeout: 30000,
        baseUrl: AppConfigs.urlBackend,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        validateStatus: (code) => code! < HttpStatus.internalServerError);

    client = Dio(options);
  }
}
