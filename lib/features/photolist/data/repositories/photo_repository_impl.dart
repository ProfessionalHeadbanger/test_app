import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/photolist/data/datasources/photos_remote_data_source.dart';
import 'package:test_app/features/photolist/data/models/photo_model.dart';
import 'package:test_app/features/photolist/domain/repositories/photo_repository.dart';

class PhotoRepositoryImpl extends PhotoRepository {
  final PhotosRemoteDataSource photosRemoteDataSource;

  PhotoRepositoryImpl(this.photosRemoteDataSource);

  @override
  Future<List<PhotoModel>> getPageOfPhotos(
      {required PhotoPageParams photoPageParams}) async {
    final photoList = await photosRemoteDataSource.getPageOfPhotos(
      photoPageParams: photoPageParams,
    );
    return photoList;
  }
}
