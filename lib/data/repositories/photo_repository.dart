import 'package:dio/dio.dart';
import 'package:flutter_architecture/data/datasource/network/api/photo_api.dart';
import 'package:flutter_architecture/data/models/photo_model.dart';

class PhotoRepository {
  final PhotoApi photoApi;

  PhotoRepository(this.photoApi);

  Future<List<PhotoModel>> getUsersRequested() async {
    try {
      final response = await photoApi.getPhotosApi();
      final users = (response.data['data'] as List)
          .map((json) => PhotoModel.fromJson(json))
          .toList();

      return users;
    } on DioError catch (errorMessage) {
      throw errorMessage.toString();
    }
  }
}
