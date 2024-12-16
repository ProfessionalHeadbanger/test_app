import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';

abstract class PhotoRepository {
  Future<List<Photo>> getPageOfPhotos(
      {required PhotoPageParams photoPageParams});
}
