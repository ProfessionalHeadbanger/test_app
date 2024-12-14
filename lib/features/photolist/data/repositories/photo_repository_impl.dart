import 'package:dartz/dartz.dart';
import 'package:test_app/core/failures/failures.dart';
import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/photolist/data/datasources/photos_remote_data_source.dart';
import 'package:test_app/features/photolist/data/models/photo_model.dart';

class PhotoRepositoryImpl {
  final PhotosRemoteDataSource photosRemoteDataSource;

  PhotoRepositoryImpl(this.photosRemoteDataSource);

  Future<Either<Failure, List<PhotoModel>>> getPageOfPhotos(
      {required PhotoPageParams photoPageParams}) async {
    try {
      final photoList = await photosRemoteDataSource.getPageOfPhotos(
        photoPageParams: photoPageParams,
      );
      return right(photoList);
    } catch (e) {
      return left(const ServerFailure(message: 'Image retrieval error'));
    }
  }
}
