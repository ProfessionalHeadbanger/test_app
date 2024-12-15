import 'package:dio/dio.dart';
import 'package:test_app/core/constants/contants.dart';
import 'package:test_app/core/exceptions/exceptions.dart';
import 'package:test_app/core/params/params.dart';
import 'package:test_app/core/secrets/secrets.dart';
import 'package:test_app/features/photolist/data/models/photo_model.dart';

abstract interface class PhotosRemoteDataSource {
  Future<List<PhotoModel>> getPageOfPhotos(
      {required PhotoPageParams photoPageParams});
}

class PhotosRemoteDataSourceImpl implements PhotosRemoteDataSource {
  final Dio dio;

  PhotosRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PhotoModel>> getPageOfPhotos(
      {required PhotoPageParams photoPageParams}) async {
    final response = await dio.get(
      AppConstants.baseUrl,
      queryParameters: {
        'client_id': AppSecrets.clientId,
        'page': photoPageParams.page
      },
    );
    if (response.statusCode == 200) {
      final photoList = (response.data as List)
          .map((json) => PhotoModel.fromJson(json))
          .toList();

      return photoList;
    } else {
      throw ServerException();
    }
  }
}
