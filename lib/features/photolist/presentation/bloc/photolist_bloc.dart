import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/core/params/params.dart';
import 'package:test_app/features/photolist/domain/entities/photo.dart';
import 'package:test_app/features/photolist/domain/usecases/get_photos_usecase.dart';

part 'photolist_event.dart';
part 'photolist_state.dart';

class PhotolistBloc extends Bloc<PhotolistEvent, PhotolistState> {
  final GetPhotosUseCase getPhotosUseCase;

  int _currentPage = 1;

  PhotolistBloc({required this.getPhotosUseCase}) : super(PhotolistInitial()) {
    on<GetNextPageOfPhotosEvent>(_onGetNextPageOfPhotosEvent);
  }

  // слишком много запросов к серверу
  Future<void> _onGetNextPageOfPhotosEvent(
      GetNextPageOfPhotosEvent event, Emitter<PhotolistState> emit) async {
    try {
      if (state is PhotolistInitial) {
        emit(PhotoListLoading());
        final photos = await getPhotosUseCase.call(
            photoPageParams: PhotoPageParams(page: _currentPage));
        emit(PhotoListLoaded(photos: photos, hasReachedMax: photos.isEmpty));
        return;
      }
      if (state is PhotoListLoaded) {
        final currentState = state as PhotoListLoaded;
        if (currentState.hasReachedMax) return;
        emit(currentState.copyWith());
        final photos = await getPhotosUseCase.call(
            photoPageParams: PhotoPageParams(page: _currentPage + 1));
        emit(PhotoListLoaded(
            photos: currentState.photos + photos,
            hasReachedMax: photos.isEmpty));
        if (photos.isNotEmpty) _currentPage++;
      }
    } catch (e) {
      emit(PhotoListError(message: e.toString()));
    }
  }
}
