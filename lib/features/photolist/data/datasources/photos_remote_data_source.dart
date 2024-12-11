import 'package:dio/dio.dart';
import 'package:test_app/core/constants/contants.dart';
import 'package:test_app/core/secrets/secrets.dart';
import 'package:test_app/features/photolist/data/models/photo_model.dart';

abstract interface class PhotosRemoteDataSource {
  Future<List<PhotoModel>> getPageOfPhotos(int page);
}

class PhotosRemoteDataSourceImpl implements PhotosRemoteDataSource {
  final Dio dio;

  PhotosRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PhotoModel>> getPageOfPhotos(int page) async {
    try {
      final response = await dio.get(
        AppConstants.baseUrl,
        queryParameters: {'client_id': AppSecrets.clientId, 'page': page},
      );
      List<PhotoModel> photoList = [];
      // Переделать, по-любому можно делать это умнее и удобнее, чем просто циклом
      for (int i = 0; i < 10; i++) {
        photoList.add(PhotoModel.fromJson(response.data[i]));
      }

      return photoList;
    } catch (e) {
      throw Exception();
    }
  }
}
