import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/datasource/network/api/endpoints.dart';

class DioClient {
// dio instance
  final Dio _dio;

  DioClient(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.responseType = ResponseType.json;
  }

  Future<Response> get(String url) async {
    try {
      final Response response = await _dio.get(url);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
