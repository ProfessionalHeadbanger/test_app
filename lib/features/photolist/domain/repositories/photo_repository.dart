import 'package:dartz/dartz.dart';
import 'package:test_app/core/failures/failures.dart';
import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';

abstract class PhotoRepository {
  Future<Either<Failure, List<Photo>>> getPageOfPhotos(
      {required PhotoPageParams photoPageParams});
}
