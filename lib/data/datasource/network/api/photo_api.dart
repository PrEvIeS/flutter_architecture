import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/datasource/network/api/endpoints.dart';
import 'package:flutter_architecture/data/datasource/network/dio_client.dart';

class PhotoApi {
  final DioClient dioClient;

  PhotoApi({required this.dioClient});

  Future<Response> getPhotosApi() async {
    try {
      final Response response = await dioClient.get(Endpoints.photos);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
