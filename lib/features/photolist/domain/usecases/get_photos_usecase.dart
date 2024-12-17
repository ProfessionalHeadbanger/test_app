import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/photolist/domain/repositories/photo_repository.dart';

class GetPhotosUseCase {
  final PhotoRepository _photoRepository;

  GetPhotosUseCase(this._photoRepository);

  Future<List<Photo>> call({required PhotoPageParams photoPageParams}) async {
    return await _photoRepository.getPageOfPhotos(
        photoPageParams: photoPageParams);
  }
}
