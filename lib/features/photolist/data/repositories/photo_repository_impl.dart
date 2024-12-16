import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/photolist/data/datasources/photos_remote_data_source.dart';
import 'package:test_app/features/photolist/data/models/photo_model.dart';

class PhotoRepositoryImpl {
  final PhotosRemoteDataSource photosRemoteDataSource;

  PhotoRepositoryImpl(this.photosRemoteDataSource);

  Future<List<PhotoModel>> getPageOfPhotos(
      {required PhotoPageParams photoPageParams}) async {
    final photoList = await photosRemoteDataSource.getPageOfPhotos(
      photoPageParams: photoPageParams,
    );
    return photoList;
  }
}
